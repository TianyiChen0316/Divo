import json
import sys
import os
from pathlib import Path
import typing

from tqdm import tqdm
import torch

from lib.torch.safe_save import save_pickle, load_pickle, save_torch, load_torch
from lib.tools import timer

from ..core.sql_featurizer import database, Sql, PlanParser
from ..core.plan_featurizer import Plan, Operators
from ..utils.custom_tqdm import tqdm


class CacheManager:
    def __init__(self, cache_file=None, auto_save_interval=0):
        self._cache = {}
        self._cache_file = Path(cache_file) if cache_file else None
        self._auto_save_interval = auto_save_interval
        self._auto_save_count = 0
        if self._cache_file is not None:
            self.restore()

    def remove_timeout_plans(self):
        new_cache = {}
        for hash_key, (key, value) in self._cache.items():
            if value['plan'] is not None:
                new_cache[hash_key] = (key, value)
        self._cache = new_cache

    def restore(self):
        if self._cache_file is None or not os.path.isfile(self._cache_file):
            return
        state_dict = load_pickle(self._cache_file)
        self.load_state_dict(state_dict)

    def flush(self):
        self._auto_save_count = 0
        if self._cache_file is None:
            return
        save_pickle(self.state_dict(), self._cache_file)

    def _update_count(self):
        self._auto_save_count += 1
        if self._auto_save_interval > 0 and self._auto_save_count >= self._auto_save_interval:
            self.flush()

    def put(self, key, value, hash_key=None):
        if hash_key is None:
            hash_key = hash(key)
        self._cache[hash_key] = (key, value)
        self._update_count()

    def update(self, hash_key, value):
        origin = self._cache.get(hash_key, None)
        if origin is not None:
            self._cache[hash_key] = (origin[0], value)
        self._update_count()

    def get(self, hash_key, default=None, get_key=False):
        res = self._cache.get(hash_key, None)
        if res is None:
            return default
        if get_key:
            return res
        return res[1]

    def __setitem__(self, key, value):
        self.put(key, value)

    def __getitem__(self, item):
        return self.get(item)

    def __len__(self):
        return len(self._cache)

    def __bool__(self):
        return len(self._cache) == 0

    def state_dict(self):
        return {
            'cache': self._cache,
        }

    def load_state_dict(self, state_dict):
        if 'cache' in state_dict:
            self._cache = state_dict['cache']


class PostgresCacheManager(CacheManager):
    def __init__(
        self,
        table_name,
        schema_name='cache',
        auto_save_interval=0,
        hash_key_limit=512,
        key_limit=4096,
        cache_file=None,
        database_connection=None,
    ):
        super().__init__(None, auto_save_interval)
        if database_connection is None:
            database_connection = database

        self._database_connection = database_connection
        self._temp_cache = {}
        self._table_name = table_name
        self._schema_name = schema_name
        self._hash_key_limit = hash_key_limit
        self._key_limit = key_limit
        if cache_file:
            self._load_from_checkpoint(cache_file)
            if self._table_name is not None and self._cache:
                _cache_size = len(self._cache)
                self._cache, temp = {}, self._cache
                self.restore()
                _new_size = len(self._cache)
                temp.update(self._cache)
                self._cache = temp
                if not (_cache_size == len(self._cache) and _cache_size == _new_size):
                    # the file and the database do not match
                    self.flush(all=True)
        else:
            self.restore()

    def _load_from_checkpoint(self, checkpoint):
        cache_file = Path(checkpoint)
        old_state_dict = load_pickle(cache_file)
        cache_dict = {}
        for hash_key, (key, value) in old_state_dict['cache'].items():
            if len(hash_key) > self._hash_key_limit:
                hash_key = hash_key[:self._hash_key_limit]
            if len(key) > self._key_limit:
                key = key[:self._key_limit]
            cache_dict[hash_key] = (key, value)
        state_dict = {'cache': cache_dict}
        self.load_state_dict(state_dict)

    def _check_postgres(self):
        if self._table_name is None:
            return None
        if self._schema_name is None:
            table = self._table_name
        else:
            # we don't check illegal schema names here
            schema_existence = self._database_connection.execute(f"select nspname from pg_namespace where nspname = '{self._schema_name}'")
            if not schema_existence:
                # empty result
                self._database_connection.execute(f"create schema {self._schema_name}", fetch=False)
                self._database_connection.commit()
            table = f'{self._schema_name}.{self._table_name}'

        self._database_connection.execute(f"""create table if not exists {table} (
            hash_key varchar({self._hash_key_limit}) not null,
            key varchar({self._key_limit}) not null,
            latency double precision not null,
            timer_latency double precision not null,
            plan text not null,
            create_time timestamp default current_timestamp,
            hostname varchar(128) not null,
            dbname varchar(32) not null,
            port smallint not null,
            primary key (hash_key, hostname, dbname, port)
)""", fetch=False)
        self._database_connection.commit()

        return table

    def _load_plan_from_data(self, latency, timer_latency, plan):
        return {
            'latency': latency,
            'timer_latency': timer_latency,
            'plan': json.loads(plan),
        }

    def remove_timeout_plans(self):
        table = self._check_postgres()
        if table is None:
            return
        self.flush()
        sql = f"delete from {table} where plan = 'null'"
        self._database_connection.execute(sql, fetch=False)
        self._database_connection.commit()
        self.restore()

    def restore(self, update=False):
        def quote(k : str):
            return k.replace("'", "''").replace("\\", "\\\\")

        table = self._check_postgres()
        if table is None:
            return
        table_res = self._database_connection.execute(
            f"select hash_key, key, latency, timer_latency, plan "
            f"from {table} "
            f"where hostname = E'{quote(database._hostname)}' "
            f"and dbname = E'{quote(database._dbname)}' "
            f"and port = {database._port}")
        cache_dict = {}
        for hash_key, key, latency, timer_latency, plan in table_res:
            cache_dict[hash_key] = (key, self._load_plan_from_data(latency, timer_latency, plan))
        if update:
            self._cache.update(cache_dict)
        else:
            self._cache = cache_dict

    def flush(self, all=False):
        self._auto_save_count = 0

        def quote(k : str):
            return k.replace("'", "''").replace("\\", "\\\\")

        if all:
            cache = self._cache
            self._cache.update(self._temp_cache)
            self._temp_cache = {}
        else:
            cache = self._temp_cache

        table = self._check_postgres()
        if table is None:
            return
        values = []
        for hash_key, (key, value) in cache.items():
            latency, timer_latency, plan = value['latency'], value['timer_latency'], \
                json.dumps(value['plan'], ensure_ascii=False)
            values.append(f"("
                          f"E'{quote(hash_key)}', "
                          f"E'{quote(key)}', "
                          f"{latency}, "
                          f"{timer_latency}, "
                          f"E'{quote(plan)}', "
                          f"E'{quote(database._hostname)}', "
                          f"E'{quote(database._dbname)}', "
                          f"{database._port}"
                          f")")
        if values:
            for index in range(0, len(values), 10000):
                joined_values = ",\n".join(values[index : index + 10000])
                sql = (f"insert into {table} (hash_key, key, latency, timer_latency, plan, hostname, dbname, port) "
                       f"values {joined_values} "
                       f"on conflict (hash_key, hostname, dbname, port) do update set "
                       f"key = excluded.key, "
                       f"latency = excluded.latency, "
                       f"timer_latency = excluded.timer_latency, "
                       f"plan = excluded.plan, "
                       f"create_time = current_timestamp")
                self._database_connection.execute(sql, fetch=False)
                self._database_connection.commit()
        if not all:
            self._cache.update(self._temp_cache)
            self._temp_cache = {}

    def put(self, key, value, hash_key=None):
        if not isinstance(value, dict) or \
                not {'latency', 'timer_latency', 'plan'}.issubset(value.keys()):
            raise TypeError(f"invalid value: '{value}'")
        if not isinstance(key, str):
            key = str(key)
        if hash_key is None:
            hash_key = str(hash(key))

        if len(hash_key) > self._hash_key_limit:
            hash_key = hash_key[:self._hash_key_limit]
        if len(key) > self._key_limit:
            key = key[:self._key_limit]

        if hash_key is None:
            hash_key = hash(key)
        self._temp_cache[hash_key] = (key, value)
        self._update_count()

    def update(self, hash_key, value):
        if not isinstance(value, dict) or \
                not {'latency', 'timer_latency', 'plan'}.issubset(value.keys()):
            raise TypeError(f"invalid value: '{value}'")
        if not isinstance(hash_key, str):
            hash_key = str(hash_key)

        if len(hash_key) > self._hash_key_limit:
            hash_key = hash_key[:self._hash_key_limit]

        origin = self._cache.get(hash_key, None)
        if origin is None:
            origin = self._temp_cache.get(hash_key, None)
        if origin is not None:
            self._temp_cache[hash_key] = (origin[0], value)
        self._update_count()

    def get(self, hash_key, default=None, get_key=False):
        if not isinstance(hash_key, str):
            hash_key = str(hash_key)

        if len(hash_key) > self._hash_key_limit:
            hash_key = hash_key[:self._hash_key_limit]

        res = super().get(hash_key, None, get_key)
        if res is None:
            self._cache, self._temp_cache = self._temp_cache, self._cache
            res = super().get(hash_key, default, get_key)
            self._cache, self._temp_cache = self._temp_cache, self._cache
        return res


def plan_latency(sql : typing.Union[Plan, Sql], cache_manager : CacheManager = None, record_on_timeout : bool = True, detail = False):
    if isinstance(sql, Plan):
        hash_key = f'{sql.sql.filename} {sql.hints(True)}'
    elif isinstance(sql, Sql):
        hash_key = f'{sql.filename}'
    else:
        hash_key = str(sql)
    if cache_manager is not None:
        cache_value = cache_manager.get(hash_key, None)
        if cache_value is not None:
            if detail:
                return cache_value
            return cache_value['latency']
    key = str(sql)
    with timer:
        origin = None #str(sql.sql) if isinstance(sql, Plan) else None
        db_latency, plan = database.latency(key, origin, return_plan=True, cache=cache_manager is None)
    timer_latency = timer.time * 1000
    res = {
        'latency': db_latency,
        'timer_latency': timer_latency,
        'plan': plan,
    }
    if cache_manager is not None and (record_on_timeout or plan is not None):
        cache_manager.put(key, res, hash_key)
    if detail:
        return res
    return res['latency']


class PlanManager:
    def __init__(self, sqls=None):
        self.data = {}
        self.timeout = None
        self.max_time = None
        if sqls:
            self.init(sqls)

    def state_dict(self):
        return {
            'data': self.data,
            'timeout': self.timeout,
            'max_time': self.max_time
        }

    def load_state_dict(self, state_dict):
        res = state_dict.get('data', None)
        if res is not None:
            self.data = res
        res = state_dict.get('timeout', NotImplemented)
        if res is not NotImplemented:
            self.timeout = res
        res = state_dict.get('max_time', NotImplemented)
        if res is not NotImplemented:
            self.max_time = res

    def init(self, sqls, cache_manager : CacheManager = None, set_timeout=True, verbose=False):
        if verbose:
            sqls = tqdm(sqls)
        costs = []
        for sql in sqls:
            if verbose:
                sqls.set_postfix({'sql': sql.filename})
            res = plan_latency(sql, cache_manager, detail=True)
            _cost, base_plan_dict = res['latency'], res['plan']
            if base_plan_dict is None:
                raise RuntimeError(f'failed to execute baseline of {sql.filename}')

            costs.append(_cost)

            base_plan_parsed = PlanParser(base_plan_dict)
            baseline = base_plan_parsed.join_order
            is_left_deep = self._action_sequence_is_left_deep(baseline)

            valid = baseline and len(baseline) + 1 == len(sql.aliases)
            if not valid:
                if baseline:
                    print(f'Warning: baseline aliases {base_plan_parsed._aliases} does not match sql aliases {sql.aliases}, might be because of subqueries')
                print(f'Warning: Baseline of SQL {sql.filename} is not valid', file=sys.stderr)
                continue

            plan = Plan(sql)
            new_baseline = []
            for left, right, join in baseline:
                plan.join(left, right)
                new_baseline.append((left, right, Operators.default))

            plan_res = plan_latency(plan, cache_manager, detail=False)
            self.data[str(sql)] = {
                'value': plan_res,
                'actions': tuple(new_baseline),
                'parsed_plan': base_plan_parsed,
                'is_left_deep': is_left_deep,
                'base_value': _cost,
            }
        cache_manager.flush()
        self.max_time = max(costs) if self.max_time is None else max(self.max_time, *costs)
        self.set_timeout(set_database=set_timeout)

    def set_timeout(self, set_database=True):
        if self.max_time:
            self.timeout = max(60000, int(database.config.sql_timeout_limit * self.max_time))
        if self.timeout and set_database:
            database.timeout = self.timeout
        print(f'Set timeout limit to {database.timeout}', file=sys.stderr)

    def _action_sequence_is_left_deep(self, actions):
        for index, (left, right, action) in enumerate(actions):
            if index > 0:
                if not isinstance(left, int) ^ isinstance(right, int):
                    return False
        return True

    def subset(self, sqls):
        res = {}
        costs = []
        for sql in sqls:
            sql = str(sql)
            _res = self.data.get(sql, None)
            if _res is not None:
                res[sql] = _res
                costs.append(_res['base_value'])
        new_object = self.__class__()
        new_object.data = res
        new_object.max_time = max(costs)
        new_object.set_timeout(False)
        return new_object

    def update(self, sql, actions, value, parsed_plan : PlanParser = None):
        s = str(sql)
        prev = self.data.get(s, None)
        if prev is None or value < prev['value']:
            actions = tuple(actions)
            is_left_deep = self._action_sequence_is_left_deep(actions)
            if prev is None:
                base_value = None
            else:
                base_value = prev['base_value']
            if isinstance(parsed_plan, dict):
                parsed_plan = PlanParser(parsed_plan)
            self.data[s] = {
                'value': value,
                'actions': actions,
                'parsed_plan': parsed_plan,
                'is_left_deep': is_left_deep,
                'base_value': base_value,
            }

    def get(self, sql, detail=False):
        res = self.data.get(str(sql), None)
        if res is not None:
            if detail:
                return res
            return res['actions']
        return None

class SqlDataset(list):
    def __init__(self, *args, path : typing.Optional[Path] = None, **kwargs):
        super().__init__(*args, **kwargs)
        self._path : Path = path

    @property
    def path(self):
        return self._path

def load_dataset(path, device=None, use_cache=True, verbose=False, order_file='order.txt'):
    if device is None:
        device = torch.device('cpu')

    path = Path(path)
    cache_file = path.parent / f'.{path.name}.dataset.pkl'

    if use_cache:
        if os.path.isfile(cache_file):
            if verbose:
                print(f'Loading dataset from cached file {cache_file}', file=sys.stderr)
            res = load_torch(cache_file, map_location=device)
            if isinstance(res, list):
                res = SqlDataset(res, path=path)
            return res

    order_map = None
    if order_file is not None:
        order_file = path / order_file
        if os.path.isfile(order_file):
            if verbose:
                print(f'Loading file order from {order_file}', file=sys.stderr)
            with open(order_file, 'r') as f:
                order_map = list(filter(lambda x: x and x != '/', map(lambda x: x.rstrip('\n'), f.readlines())))
        else:
            if verbose:
                print(f'Warning: cannot find order file {order_file}.', file=sys.stderr)
    if order_map:
        order_map = {key: value for value, key in enumerate(order_map)}

    if order_map:
        sql_files = []
        for template_name in os.listdir(path):
            template_path = path / template_name
            if os.path.isdir(template_path):
                order_index = order_map.get(template_name, len(order_map))
                for parent, dirs, files in os.walk(template_path):
                    parent = Path(parent)
                    for file in files:
                        file = parent / file
                        if file.suffix == '.sql':
                            sql_files.append((order_index, file))
            elif template_path.suffix == '.sql':
                order_index = order_map.get(template_path.stem, len(order_map))
                sql_files.append((order_index, template_path))
        sql_files.sort(key=lambda x: x[0])
        sql_files = list(map(lambda x: x[1], sql_files))
    else:
        sql_files = []
        for parent, dirs, files in os.walk(path):
            parent = Path(parent)
            for file in files:
                file = parent / file
                if file.suffix == '.sql':
                    sql_files.append(file)
    res = SqlDataset(path=path)
    if verbose:
        print(f'Loading dataset from {path}', file=sys.stderr)
        sql_files = tqdm(sql_files, desc='Loading')
    for sql_file in sql_files:
        if verbose:
            sql_files.set_postfix({'file': sql_file.name})
        with open(sql_file, 'r') as f:
            sql_str = f.read()
        sql = Sql(sql_str, filename=sql_file.name, device=device)
        res.append(sql)

    if use_cache:
        save_torch(res, cache_file)

    return res


def load_templates(path: typing.Union[str, Path, os.PathLike], order_file='order.txt',
                   device=None, use_cache=True, temp_save_interval=350, verbose=False):
    if isinstance(path, str):
        path = Path(path).absolute()
    elif isinstance(path, Path):
        path = path.absolute()
    elif isinstance(path, os.PathLike):
        path = Path(path).absolute()
    else:
        raise ValueError("'{}' object is not a valid path".format(path.__class__.__name__))
    if device is None:
        device = torch.device('cpu')

    order_file = path / order_file

    cache_file = path.parent / '.{}.dataset.{}.pkl'.format(path.name, order_file.name)
    temporary_cache_file = cache_file.parent / (cache_file.name + '.bak')
    temp_dict = {}
    if use_cache:
        if os.path.isfile(cache_file):
            if verbose:
                print('Loading dataset from cached file {}'.format(cache_file), file=sys.stderr)
            res = load_torch(cache_file, map_location=device)
            if isinstance(res, list):
                res = SqlDataset(res, path=path)
            return res
        if os.path.isfile(temporary_cache_file):
            if verbose:
                print('Restoring previous progress from temporary file {}'.format(temporary_cache_file), file=sys.stderr)
            temp_dict = load_torch(temporary_cache_file, map_location=device)

    if not os.path.isfile(order_file):
        raise FileNotFoundError("cannot find template order file")
    with open(order_file, 'r') as f:
        templates = f.readlines()
    part_counter = 0
    parts = [[], [], []]
    for template in templates:
        template = template.rstrip('\n')
        if template == '/':
            part_counter += 1
            continue
        if not os.path.isdir(path / template):
            continue
        if part_counter >= 3:
            raise IndexError("order file has more than 3 parts")
        parts[part_counter].append(template)

    def load_sqls(path):
        sql_files = []
        for parent, dirs, files in os.walk(path):
            parent = Path(parent)
            for file in files:
                file = parent / file
                if file.suffix == '.sql':
                    sql_files.append(file)
        res = []
        for sql_file in sql_files:
            with open(sql_file, 'r') as f:
                sql_str = f.read()
            sql = Sql(sql_str, filename=sql_file.name, device=device)
            res.append(sql)
        return res

    res = SqlDataset(path=path)
    progress_count = 0
    for index, part in enumerate(parts):
        if verbose:
            desc = {0: 'training', 1: 'flexible', 2: 'testing'}[index]
            print("Loading {} dataset from {}".format(desc, path), file=sys.stderr)
            part = tqdm(part, total=len(part), desc='Loading')
        part_res = []
        for template in part:
            if template in temp_dict:
                part_res.append(temp_dict[template])
            else:
                _res = load_sqls(path / template)
                part_res.append(_res)
                temp_dict[template] = _res
                progress_count += 1
                if progress_count % temp_save_interval == 0:
                    if verbose:
                        part.set_description_str('Saving')
                    save_torch(temp_dict, temporary_cache_file)
                    if verbose:
                        part.set_description_str('Loading')
        res.append(part_res)

    if use_cache:
        save_torch(res, cache_file)

    return tuple(res)
