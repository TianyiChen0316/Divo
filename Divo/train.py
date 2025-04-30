import html
import os, sys
import shutil
from pathlib import Path
import argparse
import typing
import math
import random
import json
import logging
from enum import Enum
from functools import lru_cache

import pandas as pd
import torch

from third_party import loralib
from .utils.exception import get_exception_str, get_traceback
from lib.torch.seed import get_random_state, set_random_state, seed
from lib.torch.safe_save import load_torch, save_torch
from lib.torch.torch_summary import sum_batch
from lib.torch import lora
from lib.tools import Logger, timer, smtp
from lib.tools.interfaces import StateDictInterface
from lib.tools.randomizer import Randomizer
from lib.tools.compatibility import reconstruct_object
from lib.tools.io_capture import capture
from lib.tools.console_to_html import format_escape
from lib.tools import console_to_html, py_syntax_beautify, delay_callback
from model.rl.explorer import HalfTimeExplorer
from sql import PlanParser, Operators

from .core.sql_featurizer import database, Sql
from .core.plan_featurizer import Plan
from .model.rl import ValueBasedRL
from .model.train import load_dataset, PlanManager, plan_latency, SqlDataset
from .model.train import CacheManager, PostgresCacheManager
from .utils.custom_tqdm import tqdm


def get_logger(log_name=None, log_file=None, log_level=None):
    if log_file is None:
        log_file = database.config.log_file_name.format(database.config.experiment_id)
    if log_level is None:
        log_level = logging.DEBUG if database.config.log_debug else logging.INFO
    if log_name is None:
        log_name = database.config.log_name
    logger = Logger(log_name, level=log_level, file=log_file,
                    to_stdout=logging.DEBUG if database.config.log_stdout else None, to_stderr=logging.INFO)
    logger.format('\033[0;37m[\033[36m{levelname} \033[33m{asctime}.{msecs:03.0f}\033[37m]\033[0m {message}',
                    '%Y-%m-%d %H:%M:%S', style='{')
    return logger

def bisect_left(a, x, lo=0, hi=None, *, key=None):
    """Return the index where to insert item x in list a, assuming a is sorted.

    The return value i is such that all e in a[:i] have e < x, and all e in
    a[i:] have e >= x.  So if x already appears in the list, a.insert(i, x) will
    insert just before the leftmost x already there.

    Optional args lo (default 0) and hi (default len(a)) bound the
    slice of a to be searched.

    A custom key function can be supplied to customize the sort order.
    """

    if lo < 0:
        raise ValueError('lo must be non-negative')
    if hi is None:
        hi = len(a)
    # Note, the comparison uses "<" to match the
    # __lt__() logic in list.sort() and in heapq.
    if key is None:
        while lo < hi:
            mid = (lo + hi) // 2
            if a[mid] < x:
                lo = mid + 1
            else:
                hi = mid
    else:
        while lo < hi:
            mid = (lo + hi) // 2
            if key(a[mid]) < x:
                lo = mid + 1
            else:
                hi = mid
    return lo

@lru_cache
def load_checkpoint_torch(path : typing.Union[str, os.PathLike], map_location=None, temp_file=None):
    return load_torch(path, map_location, temp_file)

def dict_list_to_dataframe(dicts):
    df = {k: [] for k in dicts[0].keys()}
    for dic in dicts:
        for k, v in dic.items():
            df[k].append(v)
    return pd.DataFrame(df)

def warm_up(dataset : typing.Iterable[Sql], iterations=1):
    data = []
    for i in range(iterations):
        data.extend(dataset)
    random.shuffle(data)
    gen = tqdm(data, desc='Warm up')
    for sql in gen:
        gen.set_postfix({'file': sql.filename})
        database.latency(str(sql), cache=False)

class Trainer(StateDictInterface):
    class history_type(Enum):
        add_memory = 0
        train = 1
        validate = 2
        set_sample_weight = 3

    def __init__(
        self,
        train_dataset : typing.Iterable[Sql],
        test_dataset : typing.Iterable[Sql],
        device,
        checkpoint_file=None,
        load_checkpoint=True,
        extra_train_datasets : typing.Iterable[SqlDataset] = None,
        extra_test_datasets: typing.Iterable[SqlDataset] = None,
        experience_checkpoint_file=None,
        parameter_checkpoint_file=None,
        force_normalization=False,
    ):
        self.__device = device
        self.train_dataset = list(train_dataset) if not isinstance(train_dataset, SqlDataset) else train_dataset
        self.test_dataset = list(test_dataset) if not isinstance(test_dataset, SqlDataset) else test_dataset
        self.extra_train_datasets = list(extra_train_datasets) if extra_train_datasets else None
        self.extra_test_datasets = list(extra_test_datasets) if extra_test_datasets else None
        self.reset()

        default_checkpoint_file = Path(database.config.path_checkpoints) / f'{database.config.experiment_id}.checkpoint.pkl'
        if checkpoint_file is None or not os.path.exists(checkpoint_file):
            self.checkpoint_file = default_checkpoint_file
        else:
            self.checkpoint_file = Path(checkpoint_file)

        experience_checkpoint_file = Path(database.config.path_checkpoints) / experience_checkpoint_file if experience_checkpoint_file is not None else None
        if experience_checkpoint_file is None or not os.path.isfile(experience_checkpoint_file):
            self.experience_checkpoint_file = None
        else:
            self.experience_checkpoint_file = Path(experience_checkpoint_file)

        parameter_checkpoint_file = Path(database.config.path_checkpoints) / parameter_checkpoint_file if parameter_checkpoint_file is not None else None
        if parameter_checkpoint_file is None or not os.path.isfile(parameter_checkpoint_file):
            self.parameter_checkpoint_file = None
        else:
            self.parameter_checkpoint_file = Path(parameter_checkpoint_file)
        self.force_normalization = force_normalization

        self._preprocess()
        if load_checkpoint and os.path.exists(self.checkpoint_file):
            self.load_checkpoint(self.checkpoint_file)
        else:
            if self.experience_checkpoint_file is not None:
                self.load_experiences(self.experience_checkpoint_file)
            if self.parameter_checkpoint_file is not None:
                self.load_parameters(self.parameter_checkpoint_file)
            self.init()
        self._postprocess()

    def _preprocess(self):
        pass

    def _postprocess(self):
        training_set_tables = {}
        for d in (self.train_dataset, *(() if self.extra_train_datasets is None else self.extra_train_datasets)):
            for sql in d:
                tables = [sql.get_table(a) for a in sql.aliases]
                for table_index, table_name, table in tables:
                    training_set_tables[table_name] = (table_index, table)
        self.training_set_tables = training_set_tables
        testing_set_tables = {}
        for d in (self.test_dataset, *(() if self.extra_test_datasets is None else self.extra_test_datasets)):
            for sql in d:
                tables = [sql.get_table(a) for a in sql.aliases]
                for table_index, table_name, table in tables:
                    testing_set_tables[table_name] = (table_index, table)
        _testing = set(testing_set_tables.keys())
        _testing.difference_update(training_set_tables.keys())
        new_testing_set_tables = {k : testing_set_tables[k] for k in _testing}
        self.testing_set_tables = new_testing_set_tables

        table_criteria = []
        new_table_mask = []
        table_classes = []
        for index, table in enumerate(database.schema.tables):
            table_name = table.name

            if table_name in training_set_tables:
                new_table_mask.append(False)
            else:
                new_table_mask.append(True)

            crit = database.schema.table_dense_embeddings.get(table_name, None)
            if crit is None:
                crit = torch.zeros(database.schema.TABLE_DENSE_EMBEDDING_SIZE, device=self.device)
            else:
                crit = torch.tensor(crit, device=self.device)
            table_criteria.append(crit)

            # use 0 as the padding_idx
            class_ = database.schema.table_clusters.get(table_name, -1) + 1
            table_classes.append(class_)
        self.table_embedding_criteria = torch.stack(table_criteria, dim=0)
        self.table_embedding_unseen_table_mask = torch.tensor(new_table_mask, dtype=torch.bool, device=self.device)
        self.table_embedding_classes = torch.tensor(table_classes, dtype=torch.long, device=self.device)
        self.table_embedding_num_tables = len(database.schema.tables)

    @property
    def device(self):
        return self.__device

    def reset(self):
        seed(database.config.seed)
        self.experiment_id = database.config.experiment_id
        log_file = database.config.log_file_name.format(self.experiment_id)
        log_level = logging.DEBUG if database.config.log_debug else logging.INFO
        log_name = database.config.log_name
        self.log = get_logger(log_name, log_file, log_level)

        self.randomizers = {
            'sample': Randomizer(random.getrandbits(64)),
            'exploration': Randomizer(random.getrandbits(64)),
        }
        self.baseline_explorer = HalfTimeExplorer(0.5, 0.2, 80)
        self.rl_model = ValueBasedRL(
            self.__device,
            num_table_layers=database.config.extractor_num_table_layers,
            initial_exploration_prob=database.config.rl_initial_exploration_prob,
        )
        self.baseline_plan_manager = PlanManager()
        self.plan_manager = PlanManager()
        cache_file = database.config.cache_file_name
        if '{}' in cache_file:
            cache_file = cache_file.format(self.experiment_id)
        if database.config.cache_type == 'postgres':
            self.cache_manager = PostgresCacheManager(
                table_name=database.config.cache_table_name,
                schema_name='cache',
                auto_save_interval=database.config.cache_save_interval,
                cache_file=None if not os.path.isfile(cache_file) else cache_file,
            )
        else:
            # 'file'
            self.cache_manager = CacheManager(cache_file, auto_save_interval=database.config.cache_save_interval)

        self.worst_training_sqls = []
        self.epoch_history = None
        self.history = []
        self.sample_weights = None
        self.prob_bias = None
        self.validate_results = []
        self.time_records = []
        self.epoch = 0
        self.bushy = None
        self.initialized = False
        self._current_training_dataset = None
        self.lora_rank = database.config.lora_rank

        self.register('worst_training_sqls')
        self.register('rl_model')
        self.register('plan_manager')
        self.register('baseline_plan_manager')
        self.register('sample_weights')
        self.register('prob_bias')
        self.register('baseline_explorer')
        self.register('validate_results')
        self.register('time_records')
        self.register('history')
        self.register('initialized')
        self.register('_current_training_dataset')
        self.register('lora_rank')

    def load_checkpoint(self, checkpoint_file=None):
        if checkpoint_file is None:
            checkpoint_file = self.checkpoint_file
        elif not isinstance(checkpoint_file, Path):
            checkpoint_file = Path(checkpoint_file)
        self.log(f'Loading checkpoint from {checkpoint_file}')
        if os.path.isdir(checkpoint_file):
            checkpoint_file = checkpoint_file / 'checkpoint.pkl'
        dic = load_checkpoint_torch(checkpoint_file)

        dic_lora_rank = dic.get('lora_rank', None)
        if dic_lora_rank is not None:
            database.config.lora_rank = dic_lora_rank
            self.set_lora_rank()

        if not database.config.load_random_state:
            self.log(f'Discard random state and set random seed to {database.config.seed}')
            if 'randomizers' in dic:
                del dic['randomizers']
            for randomizer in self.randomizers.values():
                randomizer.seed = database.config.seed

        self.load_state_dict(dic)
        self.log('Loaded')

    def _legacy_load_experiences(self, checkpoint_file):
        # load only experiences and the best value table
        # must be called before initialization
        self.log(f'Loading experiences from {checkpoint_file}')
        dic = load_checkpoint_torch(checkpoint_file)
        self.rl_model.memory.load_state_dict(dic['rl_model']['memory'])
        self.rl_model.pair_memory.load_state_dict(dic['rl_model']['pair_memory'])
        self.rl_model.best_values.load_state_dict(dic['rl_model']['best_values'])
        self.log('Loaded')

    def load_experiences(self, checkpoint_file):
        # load only experiences and the best value table
        # must be called before initialization
        if database.config.ignore_testing_set_leakage:
            test_set_queries = set()
        else:
            test_set_queries = set(x.filename for x in self.test_dataset)
            if self.extra_test_datasets:
                for d in self.extra_test_datasets:
                    test_set_queries.update(x.filename for x in d)

        self.log(f'Loading experiences from {checkpoint_file}')
        dic = load_checkpoint_torch(checkpoint_file)
        pair_memories = [*map(lambda x: x['pair_memory'], dic['experiences'].values()), dic['rl_model']['pair_memory']['memories']]
        cache = dic['rl_model']['best_values']['cache']

        sql_dict = {}
        def reconstruct_plan(plan):
            new_plan : Plan = reconstruct_object(plan, Plan)
            if new_plan.sql.filename in sql_dict:
                new_plan.sql = sql_dict[new_plan.sql.filename]
            else:
                new_sql = reconstruct_object(new_plan.sql, Sql)
                sql_dict[new_sql.filename] = new_sql
                new_plan.sql = new_sql
            return new_plan

        new_pair_memory = []
        for pair_memory_dict in pair_memories:
            for sql_name, plan_dict in pair_memory_dict.items():
                new_pair_memory.extend(
                    filter(
                        lambda x: x[1].sql.filename not in test_set_queries,
                        map(
                            lambda x: (
                                x[0],
                                reconstruct_plan(x[1]),
                                self.rl_model._rev_value_preprocess(cache[x[0]]),
                            ),
                            plan_dict.items(),
                        ),
                    ),
                )

        for hash_key, plan, value in new_pair_memory:
            self.rl_model.add_pair_memory(plan, value)

        self.log('Loaded')

    def load_parameters(self, checkpoint_file):
        # load only experiences and the best value table
        # must be called before initialization
        self.log(f'Loading parameters from {checkpoint_file}')
        dic = load_checkpoint_torch(checkpoint_file)

        current_lora_rank = self.lora_rank
        dic_lora_rank = dic.get('lora_rank', None)
        if dic_lora_rank is not None:
            database.config.lora_rank = dic_lora_rank
            self.set_lora_rank()

        self.rl_model.model_extractor.load_state_dict(dic['rl_model']['model_extractor'], strict=False)
        if database.config.use_lstm:
            self.rl_model.model_lstm.load_state_dict(dic['rl_model']['model_lstm'], strict=False)
        else:
            self.rl_model.model_transformer.load_state_dict(dic['rl_model']['model_transformer'], strict=False)

        if dic_lora_rank is not None:
            database.config.lora_rank = current_lora_rank
            self.set_lora_rank()

        self.log('Loaded')

    def init(self, save_initial_checkpoint=True):
        self.log('Initializing models')

        if (database.config.max_initial_experience_queries
            and len(self.train_dataset) > database.config.max_initial_experience_queries):
            #train_dataset = self.randomizers['sample'].sample(self.train_dataset, database.config.max_initial_experience_queries)
            train_dataset = self.train_dataset[:database.config.max_initial_experience_queries]
        else:
            train_dataset = list(self.train_dataset)

        if self.extra_train_datasets:
            for d in self.extra_train_datasets:
                if (database.config.max_initial_experience_queries
                    and len(d) > database.config.max_initial_experience_queries):
                    train_dataset.extend(self.randomizers['sample'].sample(d, database.config.max_initial_experience_queries))
                else:
                    train_dataset.extend(d)

        test_dataset = list(self.test_dataset)
        if self.extra_test_datasets:
            for d in self.extra_test_datasets:
                test_dataset.extend(d)

        self.baseline_plan_manager.init(
            (*train_dataset, *test_dataset),
            self.cache_manager,
            set_timeout=False,
            verbose=True,
        )
        self.plan_manager.init(
            train_dataset,
            self.cache_manager,
            set_timeout=True,
            verbose=True,
        )
        if database.timeout < 100000:
            self.log('Set timeout limit to 100000')
            database.timeout = 100000
        self.cache_manager.flush()

        self.log('Adding initial experiences')
        preprocess_plans = []
        sql_graphs = [sql.graph for sql in train_dataset]

        for sql in train_dataset:
            plan_results = self.plan_manager.get(sql, detail=True)
            if plan_results is None or plan_results['actions'] is None:
                continue
            best_order, best_value = plan_results['actions'], plan_results['value']
            with torch.no_grad():
                plan_set = []
                plan = self.rl_model.plan_init(sql)
                while not plan.completed:
                    action = best_order[plan.total_branch_nodes]
                    self.rl_model.step(plan, action)
                    self.rl_model.add_memory(plan.clone(), best_value)
                    plan_set.append(plan.clone())
                    if database.config.transformer_node_attrs_preprocess_zscore in ('all',):
                        preprocess_plans.append(plan.clone())
            self.rl_model.add_pair_memory(plan.clone(), best_value)
            self.rl_model.add_priority_memory(plan_set, best_value)
            base_latency = plan_latency(plan.sql, self.cache_manager)
            self.rl_model.update_baseline_value(plan.sql, base_latency)

            if database.config.transformer_node_attrs_preprocess_zscore in ('all', 'completed'):
                preprocess_plans.append(plan.clone())

        if self.parameter_checkpoint_file is None or self.force_normalization:
            # the model is not initialized with pretrained parameters
            if sql_graphs:
                self.rl_model.model_extractor.fit_norm(sql_graphs)

            if preprocess_plans:
                self.log('Calculating mean and std for Z-score normalization')
                prep_features = [plan.to_sequence() for plan in preprocess_plans]
                prep_node_attrs = [features['node_attr'][features['node_attr_mask'] != 0] for features in prep_features]
                prep_node_attrs = torch.cat(prep_node_attrs, dim=0)[..., :3]
                if torch.numel(prep_node_attrs) == 0:
                    prep_node_attrs = torch.zeros(1, 3, device=self.__device)
                if not database.config.use_lstm:
                    self.rl_model.model_transformer.node_attr_zscore.fit(prep_node_attrs)

        if save_initial_checkpoint:
            initial_checkpoint = Path(database.config.path_checkpoints) / f'{database.config.experiment_id}.init.pkl'
            self.log(f'Saving initial checkpoint to {initial_checkpoint}')
            save_torch(self.state_dict(), initial_checkpoint)
            self.log('Saved')

        self.initialized = True

    def state_dict(self):
        res = super().state_dict()
        res.update({
            'epoch': self.epoch,
            'timeout_limit': database.timeout,
            'random_state': get_random_state(),
            'randomizers': {k : v.state_dict() for k, v in self.randomizers.items()},
        })
        return res

    def load_state_dict(self, state_dict):
        res = super().load_state_dict(state_dict)
        if 'epoch' in state_dict:
            self.epoch = state_dict['epoch']
            self.rl_model.schedule(self.epoch)
        if 'timeout_limit' in state_dict:
            database.timeout = state_dict['timeout_limit']
        if 'random_state' in state_dict:
            set_random_state(state_dict['random_state'])
        if 'randomizers' in state_dict:
            for k, v in state_dict['randomizers'].items():
                if k not in self.randomizers:
                    self.randomizers[k] = Randomizer(0)
                self.randomizers[k].load_state_dict(v)
        return res

    def send_email(self, title, message, desc=None):
        if database.config.email is not None and database.config.email_password is not None:
            self.log(f'Sending email as {database.config.email} with title {title}')
            title = f'{database.config.email_product_name} | {title}'
            if desc is None:
                from_ = None
            else:
                from_ = title
                title = desc
            html_args = {
                'product_name': database.config.email_product_name,
                'message': message,
            }
            receiver = database.config.email_receiver if database.config.email_receiver else None
            with smtp.login(database.config.email, database.config.email_password, ssl=True) as m:
                if m is not None:
                    success = smtp.mail(m, smtp.mime_from_file(title, 'html/remind.html', replace=html_args, from_=from_), receiver=receiver)
                else:
                    success = False
            if not success:
                self.log(f'Failed to send mail as {database.config.email}', level=logging.WARNING)
            else:
                self.log(f'Sent email as {database.config.email}')

    def _train(self, train_method, validate_method, save_method, after_validation=None):
        total_epochs = database.config.iteration
        while self.epoch < total_epochs:
            epoch = self.epoch
            self.epoch_history = []
            self.bushy = database.config.bushy and epoch >= database.config.bushy_start_epoch
            train_method()
            epoch = epoch + 1
            if epoch > database.config.validate_start and epoch % database.config.validate_interval == 0:
                validate_method()
            self.cache_manager.flush()
            self.rl_model.schedule()
            if callable(after_validation):
                after_validation()
            self.epoch = epoch
            self.history.append(self.epoch_history)
            save_method()

    def save_checkpoint(self, checkpoint_file=None):
        if checkpoint_file is None:
            checkpoint_file = self.checkpoint_file
        elif not isinstance(checkpoint_file, Path):
            checkpoint_file = Path(checkpoint_file)
        self.log(f'Saving checkpoint to {checkpoint_file}')
        if database.config.save_checkpoint_as_folder:
            tmp_file = checkpoint_file.parent / '.{}.tmp'.format(checkpoint_file.name)
            target_file = checkpoint_file / 'checkpoint.pkl'
            if os.path.isfile(checkpoint_file):
                if os.path.isfile(tmp_file):
                    os.remove(tmp_file)
                os.rename(checkpoint_file, tmp_file)
            os.makedirs(checkpoint_file, exist_ok=True)
            if not os.path.isfile(target_file) and os.path.isfile(tmp_file):
                os.rename(tmp_file, checkpoint_file / 'checkpoint.pkl')
            if (database.config.save_epoch_checkpoints and (
                    not database.config.save_epoch_checkpoints_interval or
                    (self.epoch % database.config.save_epoch_checkpoints_interval) == 0)):
                epoch_target_file = checkpoint_file / f'checkpoint.{self.epoch - 1:03d}.pkl'
                res = save_torch(self.state_dict(), epoch_target_file)
                shutil.copy(epoch_target_file, target_file)
            else:
                res = save_torch(self.state_dict(), target_file)
        else:
            res = save_torch(self.state_dict(), checkpoint_file)
        self.log('Saved')
        return res

    def train(self):
        def save_checkpoint():
            if self.epoch % database.config.save_checkpoint_interval == 0:
                self.save_checkpoint()
        return self._train(self._train_one_epoch, self._validate, save_checkpoint, self._train_after_validation)

    def update_base_plan(self, sql):
        # try to get the base plan order
        _origin_time = plan_latency(sql, self.cache_manager, detail=True)
        _cost, _base_plan_dict = _origin_time['latency'], _origin_time['plan']
        if _base_plan_dict is None:
            raise RuntimeError(f'failed to execute baseline of {sql.filename}')
        _base_plan_parsed = PlanParser(_base_plan_dict)
        _baseline = _base_plan_parsed.join_order
        _new_baseline = []
        for left, right, join in _baseline:
            _new_baseline.append((left, right, Operators.default))
        self.baseline_plan_manager.update(sql, tuple(_new_baseline), _cost, _base_plan_parsed)
        self.rl_model.update_baseline_value(sql, _origin_time['latency'])
        return self.baseline_plan_manager.get(sql)

    def _validate_dataset(self, dataset : typing.Iterable[Sql]):
        dataset = tuple(dataset)
        if len(dataset) == 0:
            raise RuntimeError('empty dataset')

        self.rl_model.eval_mode()
        res = []
        with torch.no_grad():
            gen = tqdm(dataset)
            for sql in gen:
                with timer:
                    plan_result = self.rl_model.get_plan(sql, bushy=True, beam_size=database.config.beam_width, detail=True)
                    plan = plan_result['result']
                    detail_time = plan_result['time']
                inference_time = timer.time * 1000
                origin_execution_time = plan_latency(sql, self.cache_manager, detail=True)
                timeout = database.timeout
                drop_cache_on_timeout = database.config.epoch_low_timeout_limit is not None and \
                                        self.epoch <= database.config.epoch_low_timeout_limit
                if drop_cache_on_timeout:
                    database.timeout = origin_execution_time['latency'] * 10.
                else:
                    database.timeout = timeout #max(origin_execution_time['latency'] * 20., min(timeout, 10000))
                detailed_execution_time = plan_latency(plan, self.cache_manager, record_on_timeout=not drop_cache_on_timeout, detail=True)
                database.timeout = timeout
                is_timeout = detailed_execution_time['plan'] is None
                if is_timeout:
                    detailed_execution_time['latency'] = timeout

                relative_latency = detailed_execution_time['latency'] / origin_execution_time['latency']
                timer_relative_latency = detailed_execution_time['timer_latency'] / origin_execution_time['timer_latency']

                origin_plan_order = self.baseline_plan_manager.get(sql)
                if origin_plan_order is None:
                    origin_plan_order = self.update_base_plan(sql)

                if origin_plan_order is None:
                    comparison_result = None
                    comparison_success = None
                    prediction = self.rl_model.predict_plan(plan, detail=True, gt=detailed_execution_time['latency'])
                    loss, origin_loss = prediction['loss'], None
                    pred_detail, ori_detail = prediction['detail'], None
                    comparison_detail = None
                else:
                    origin_plan = self.rl_model.plan_init(sql)
                    while not origin_plan.completed:
                        self.rl_model.step(origin_plan, origin_plan_order[origin_plan.total_branch_nodes])
                    prediction = self.rl_model.compare_plan(
                        plan,
                        origin_plan,
                        detail=True,
                        gt1=detailed_execution_time['latency'],
                        gt2=origin_execution_time['latency'],
                    )
                    comparison_result = prediction['comparison']
                    loss, origin_loss = prediction['loss1'], prediction['loss2']
                    comparison_success = None if comparison_result == 0 else ((relative_latency < 1) ^ (comparison_result > 0))
                    pred_detail, ori_detail = prediction['detail1'], prediction['detail2']
                    comparison_detail = prediction['comparison_detail']['probs']

                res.append({
                    'file': sql.filename,
                    'latency': detailed_execution_time['latency'],
                    'baseline_latency': origin_execution_time['latency'],
                    'relative_latency': relative_latency,
                    'loss': loss,
                    'detail': str(pred_detail),
                    'baseline_loss': origin_loss,
                    'baseline_detail': None if ori_detail is None else str(ori_detail),
                    'timer_latency': detailed_execution_time['timer_latency'],
                    'baseline_timer_latency': origin_execution_time['timer_latency'],
                    'timer_relative_latency': timer_relative_latency,
                    'inference_time': inference_time,
                    'comparison_result': comparison_result,
                    'comparison_detail': comparison_detail,
                    'comparison_success': comparison_success,
                    'comparison_latency': detailed_execution_time['latency'] if comparison_result is not None and comparison_result < 0 else origin_execution_time['latency'],
                    'baseline': origin_plan.hints(),
                    'plan': plan.hints(),
                    'time_init': detail_time['init'],
                    'time_gpu': detail_time['gpu'],
                    'time_explain': detail_time['explain'],
                    'time_to_sequence': detail_time['to_sequence'],
                    'time_join': detail_time['join'],
                    'time_other_cpu': detail_time['total'] - detail_time['init'] - detail_time['gpu'] - detail_time['explain'] - detail_time['to_sequence'] - detail_time['join'],
                })
                gen.set_postfix({
                    'relative': relative_latency,
                })
        res = dict_list_to_dataframe(res)
        return res

    def _validate_df_collect_data(self, df):
        gmrl = math.exp(df['relative_latency'].map(math.log).sum() / len(df))
        gmrl_comparison = math.exp(
            (df['comparison_latency'] / df['baseline_latency']).map(math.log).sum() / len(df))
        speedup = df['baseline_latency'].sum() / df['latency'].sum()
        speedup_comparison = df['baseline_latency'].sum() / df['comparison_latency'].sum()
        comparison_accuracy = df['comparison_success'].astype(float).dropna().mean()
        return {
            'gmrl': gmrl,
            'gmrl_comparison': gmrl_comparison,
            'speedup': speedup,
            'speedup_comparison': speedup_comparison,
            'comparison_accuracy': comparison_accuracy,
        }

    def _to_email_df(self, df : pd.DataFrame, rename_mapping : dict):
        rename_mapping = tuple((k, rename_mapping[k]) for k in filter(lambda x: x in rename_mapping, df.keys()))
        new_df = df[[*tuple(zip(*rename_mapping))[0]]].rename({k : v for k, v in rename_mapping}, axis=1)
        new_df = new_df.applymap(lambda x: round(x, 3) if isinstance(x, float) else x)
        return new_df

    def _validation_preprocess(self):
        if hasattr(self.rl_model.model_extractor, 'embedding_table_id') and \
            self.rl_model.model_extractor.embedding_table_id._enable:
            table_embeddings = self.rl_model.model_extractor.embedding_table_id.export_embeddings_with_criteria(
                self.table_embedding_criteria,
                self.table_embedding_unseen_table_mask,
                self.table_embedding_classes,
                self.table_embedding_num_tables,
                dist_norm_type='fro', # 2
                dist_topk=3,
            )
            self.rl_model.model_extractor.load_table_frozen_embeddings(table_embeddings, self.table_embedding_unseen_table_mask)

    def _pick_worst_from_dataset(
        self,
        validate_df: pd.DataFrame,
        dataset: list,
        ratio: float = 0.1,
        relative: bool = True,
        cap: typing.Optional[float] = None,
    ):
        if relative:
            new_df = validate_df.sort_values('relative_latency', axis=0)
        else:
            new_df = validate_df.sort_values('latency', axis=0)
        if cap is not None:
            new_df = new_df[new_df['relative_latency'] >= cap]
        worst = new_df.iloc[:round(len(validate_df) * ratio)]
        res = [(i, dataset[i]) for i in worst.index]
        return res

    def _validate(self, add_history=True, save_path=None, prefix=None):
        self._validation_preprocess()

        rename_mapping = {
            'file': 'file',
            'latency': 'time',
            'baseline_latency': 'ori',
            'relative_latency': 'rel',
            'loss': 'loss',
            'detail': 'detail',
            'baseline_loss': 'oloss',
            'baseline_detail': 'odetail',
            'comparison_result': 'cmp',
            'comparison_detail': 'cmp_d',
            'comparison_success': 'correct?',
            'baseline': 'base',
            'plan': 'plan',
        }

        validate_df_rename_mapping = {
            'epoch': 'epoch',
            'test_gmrl': 'GMRL',
            'test_gmrl_comparison': 'GMRL (cmp)',
            'test_speedup': 'Speed',
            'test_speedup_comparison': 'Speed (cmp)',
            'test_comparison_accuracy': 'Acc',
            'train_gmrl': 'tGMRL',
            'train_gmrl_comparison': 'tGMRL (cmp)',
            'train_speedup': 'tSpeed',
            'train_speedup_comparison': 'tSpeed (cmp)',
            'train_comparison_accuracy': 'tAcc',
        }

        if save_path is None:
            save_path = database.config.path_results
        if prefix is not None:
            prefix = f'{prefix}.'
        else:
            prefix = ''

        if add_history:
            self.epoch_history.append((
                self.history_type.validate,
                (),
            ))

        path_results = Path(save_path) / f'{prefix}{self.experiment_id}'
        os.makedirs(path_results, exist_ok=True)

        self.log('Validating with test dataset')
        _df_test = self._validate_dataset(self.test_dataset)
        df_test = _df_test.sort_values(by='file')
        test_res = self._validate_df_collect_data(df_test)
        self.log(f"Test set GMRL: {test_res['gmrl']:.03f} / {test_res['gmrl_comparison']:.03f} speedup: {test_res['speedup']:.03f} / {test_res['speedup_comparison']:.03f}")
        self.log(f"Test set comparison accuracy: {100 * test_res['comparison_accuracy']:.03f}%")
        df_test.to_csv(path_results / f'test.{self.epoch:03d}.csv', index=False)
        all_df_tests = [df_test]

        extra_test_dataset_str = []
        extra_test_dataset_df_str = []
        if self.extra_test_datasets:
            for index, test_dataset in enumerate(self.extra_test_datasets):
                self.log(f'Validating with extra test dataset {index}')
                _df_extra_test = self._validate_dataset(test_dataset)
                df_extra_test = _df_extra_test.sort_values(by='file')
                extra_test_res = self._validate_df_collect_data(df_extra_test)
                self.log(f"Extra test set GMRL: {extra_test_res['gmrl']:.03f} / {extra_test_res['gmrl_comparison']:.03f} speedup: {extra_test_res['speedup']:.03f} / {extra_test_res['speedup_comparison']:.03f}")
                self.log(f"Extra test set comparison accuracy: {100 * extra_test_res['comparison_accuracy']:.03f}%")
                df_extra_test.to_csv(path_results / f'test.extra{index}.{self.epoch:03d}.csv', index=False)
                extra_test_dataset_str.append(f"""<span>Extra test set {index} speedup: {extra_test_res['speedup']:.03f} / {extra_test_res['speedup_comparison']:.03f}; GMRL: {extra_test_res['gmrl']:.03f} / {extra_test_res['gmrl_comparison']:.03f}; comparison accuracy: {100 * extra_test_res['comparison_accuracy']:.03f}%</span><br />\n""")
                extra_test_dataset_df_str.append(f"""<h3>Extra test dataset {index}</h3>\n{self._to_email_df(df_extra_test, rename_mapping).to_html(index=False)}\n""")
                all_df_tests.append(df_extra_test)
            all_df_tests = pd.concat(all_df_tests, axis=0)
            all_df_test_res = self._validate_df_collect_data(all_df_tests)
            self.log(f"All test set GMRL: {all_df_test_res['gmrl']:.03f} / {all_df_test_res['gmrl_comparison']:.03f} speedup: {all_df_test_res['speedup']:.03f} / {all_df_test_res['speedup_comparison']:.03f}")
            self.log(f"All test set comparison accuracy: {100 * all_df_test_res['comparison_accuracy']:.03f}%")
            extra_test_dataset_str.append(f"""<span>All test set speedup: {all_df_test_res['speedup']:.03f} / {all_df_test_res['speedup_comparison']:.03f}; GMRL: {all_df_test_res['gmrl']:.03f} / {all_df_test_res['gmrl_comparison']:.03f}; comparison accuracy: {100 * all_df_test_res['comparison_accuracy']:.03f}%</span><br />\n""")

        if not database.config.validate_with_training_dataset:
            train_res_str = ""
            df_train_str = ""
            extra_train_dataset_str = []
            train_res = {}
        else:
            self.log('Validating with train dataset')
            use_partial_train_dataset = (database.config.max_initial_experience_queries
                and len(self.train_dataset) > database.config.max_initial_experience_queries)
            if use_partial_train_dataset:
                train_dataset = self.train_dataset[:database.config.max_initial_experience_queries]
            else:
                train_dataset = self.train_dataset
            _df_train = self._validate_dataset(train_dataset)

            if database.config.use_worst_training_sql_ratio:
                worst_sqls = self._pick_worst_from_dataset(
                    _df_train,
                    train_dataset,
                    ratio=database.config.use_worst_training_sql_ratio,
                    relative=database.config.use_worst_training_sql_use_relative,
                    cap=database.config.use_worst_training_sql_relative_latency_cap,
                )
            else:
                worst_sqls = []

            df_train = _df_train.sort_values(by='file')
            train_res = self._validate_df_collect_data(df_train)
            self.log(f"Train set GMRL: {train_res['gmrl']:.03f} / {train_res['gmrl_comparison']:.03f} speedup: {train_res['speedup']:.03f} / {train_res['speedup_comparison']:.03f}")
            self.log(f"Train set comparison accuracy: {100 * train_res['comparison_accuracy']:.03f}%")
            df_train.to_csv(path_results / f'train.{self.epoch:03d}.csv', index=False)
            train_res_str = f"""<span>Train set speedup: {train_res['speedup']:.03f} / {train_res['speedup_comparison']:.03f}; GMRL: {train_res['gmrl']:.03f} / {train_res['gmrl_comparison']:.03f}; comparison accuracy: {100 * train_res['comparison_accuracy']:.03f}%</span><br />\n"""
            all_df_trains = [df_train]

            extra_worst_sqls = []
            extra_train_dataset_str = []
            extra_train_dataset_df_str = []
            if self.extra_train_datasets:
                for index, train_dataset in enumerate(self.extra_train_datasets):
                    self.log(f'Validating with extra train dataset {index}')
                    use_partial_train_dataset = (database.config.max_initial_experience_queries
                        and len(train_dataset) > database.config.max_initial_experience_queries)
                    if use_partial_train_dataset:
                        train_dataset = train_dataset[:database.config.max_initial_experience_queries]
                    _df_extra_train = self._validate_dataset(train_dataset)

                    if database.config.use_worst_training_sql_ratio:
                        _worst = self._pick_worst_from_dataset(
                            _df_extra_train,
                            train_dataset,
                            ratio=database.config.use_worst_training_sql_ratio,
                            relative=database.config.use_worst_training_sql_use_relative,
                        )
                        extra_worst_sqls.extend(_worst)

                    df_extra_train = _df_extra_train.sort_values(by='file')
                    extra_train_res = self._validate_df_collect_data(df_extra_train)
                    self.log(f"Extra train set {index} GMRL: {extra_train_res['gmrl']:.03f} / {extra_train_res['gmrl_comparison']:.03f} speedup: {extra_train_res['speedup']:.03f} / {extra_train_res['speedup_comparison']:.03f}")
                    self.log(f"Extra train set {index} comparison accuracy: {100 * extra_train_res['comparison_accuracy']:.03f}%")
                    df_extra_train.to_csv(path_results / f'train.extra{index}.{self.epoch:03d}.csv', index=False)
                    extra_train_dataset_str.append(f"""<span>Extra train set {index} speedup: {extra_train_res['speedup']:.03f} / {extra_train_res['speedup_comparison']:.03f}; GMRL: {extra_train_res['gmrl']:.03f} / {extra_train_res['gmrl_comparison']:.03f}; comparison accuracy: {100 * extra_train_res['comparison_accuracy']:.03f}%</span><br />\n""")
                    extra_train_dataset_df_str.append(f"""<h3>Extra train dataset {index}</h3>\n{self._to_email_df(df_extra_train, rename_mapping).to_html(index=False)}\n""")
                    all_df_trains.append(df_extra_train)
                all_df_trains = pd.concat(all_df_trains, axis=0)
                all_df_train_res = self._validate_df_collect_data(all_df_trains)
                self.log(f"All train set GMRL: {all_df_train_res['gmrl']:.03f} / {all_df_train_res['gmrl_comparison']:.03f} speedup: {all_df_train_res['speedup']:.03f} / {all_df_train_res['speedup_comparison']:.03f}")
                self.log(f"All train set comparison accuracy: {100 * all_df_train_res['comparison_accuracy']:.03f}%")
                extra_train_dataset_str.append(f"""<span>All train set speedup: {all_df_train_res['speedup']:.03f} / {all_df_train_res['speedup_comparison']:.03f}; GMRL: {all_df_train_res['gmrl']:.03f} / {all_df_train_res['gmrl_comparison']:.03f}; comparison accuracy: {100 * all_df_train_res['comparison_accuracy']:.03f}%</span><br />\n""")
            df_train_str = f"""<h3>Train dataset</h3>
    {self._to_email_df(df_train, rename_mapping).to_html(index=False)}
    {''.join(extra_train_dataset_df_str)}"""

            if not use_partial_train_dataset and self.epoch >= 10:
                _raw_tops = _df_train['latency'].nlargest(max(round(len(_df_train) * 0.125), 1)).index.astype(int).tolist()
                raw_to_total_portion = [0 for i in range(len(_df_train))]
                for index in _raw_tops:
                    raw_to_total_portion[index] += 1 / len(_raw_tops)
                self.prob_bias = list(map(lambda x: min(max(x - train_res['gmrl'], 0), 200.0), _df_train['relative_latency']))
                _total_weight = sum(self.prob_bias)
                alpha_absolute = database.config.resample_alpha
                self.sample_weights = [
                    (1 - alpha_absolute) * (rel / _total_weight) + alpha_absolute * por
                    for rel, por in zip(self.prob_bias, raw_to_total_portion)
                ]
            else:
                self.sample_weights = None

            worst_training_sqls = []
            if self.prob_bias:
                worst_training_sqls.extend((w[1], self.prob_bias[w[0]], True) for w in worst_sqls)
            else:
                worst_training_sqls.extend((w[1], None, True) for w in worst_sqls)
            worst_training_sqls.extend((w[1], None, False) for w in extra_worst_sqls)

            self.worst_training_sqls = worst_training_sqls

        validate_res = {
            'epoch': self.epoch,
            **{'test_' + k : v for k, v in test_res.items()},
            **{'train_' + k: v for k, v in train_res.items()},
        }
        self.validate_results.append(validate_res)
        validate_df = dict_list_to_dataframe(self.validate_results)
        validate_df.to_csv(path_results / f'results.csv', index=False)

        extra_email_info = self._validate_extra_email_info()
        if extra_email_info is None:
            extra_email_info = ''

        self.send_email(
            f'{prefix}{self.experiment_id}',
            f"""
<span>Test set speedup: {test_res['speedup']:.03f} / {test_res['speedup_comparison']:.03f}; GMRL: {test_res['gmrl']:.03f} / {test_res['gmrl_comparison']:.03f}; comparison accuracy: {100 * test_res['comparison_accuracy']:.03f}%</span><br />
{''.join(extra_test_dataset_str)}{train_res_str}{''.join(extra_train_dataset_str)}{extra_email_info}<hr />
<h3>All results</h3>
{self._to_email_df(validate_df, validate_df_rename_mapping).to_html(index=False)}
<h3>Test dataset</h3>
{self._to_email_df(df_test, rename_mapping).to_html(index=False)}
{''.join(extra_test_dataset_df_str)}{df_train_str}""",
            f"Epoch {self.epoch:03d} ({test_res['speedup_comparison']:.02f}, {test_res['gmrl_comparison']:.02f}, {100 * test_res['comparison_accuracy']:.02f}%)",
        )

        if add_history:
            self.epoch_history.append((
                self.history_type.set_sample_weight,
                (self.sample_weights, )
            ))

    def _validate_extra_email_info(self):
        pass

    class _plan_search_res:
        def __init__(self, state, action=None, parent_state=None, parent_index=None, value=None, is_exploration=False):
            self.state = state
            self.action = action
            self.value = value
            self.parent_state = parent_state
            self.parent_index = parent_index
            self.is_exploration = is_exploration

    def _sample_dataset(self, dataset, sample_weights=None, prob_bias=None, resample_count=None):
        if resample_count is None:
            resample_count = database.config.resample_count
        if prob_bias is None:
            dataset = list(map(lambda x: (x, None), dataset))
        else:
            dataset = list(zip(dataset, prob_bias))
        resample_mode = database.config.resample_mode
        if self.epoch >= database.config.resample_start_epoch and self.epoch % database.config.resample_interval == 0:
            if resample_mode == 'replace':
                if len(dataset) > resample_count:
                    new_train_dataset = self.randomizers['sample'].sample(dataset, k=len(dataset) - resample_count)
                else:
                    new_train_dataset = []
                new_train_dataset.extend(self.randomizers['sample'].choices(dataset, weights=sample_weights, k=resample_count))
                dataset = new_train_dataset
            elif resample_mode == 'augment':
                dataset = [*dataset, *self.randomizers['sample'].choices(dataset, weights=sample_weights, k=resample_count)]
            elif resample_mode == 'sample':
                if len(dataset) > resample_count:
                    new_train_dataset = self.randomizers['sample'].sample(dataset, k=resample_count)
                else:
                    new_train_dataset = dataset #[*dataset, self.randomizers['sample'].choices(dataset, weights=sample_weights, k=resample_count - len(dataset))]
                dataset = new_train_dataset
            else:
                # augment_deterministic
                if sample_weights is not None:
                    train_dataset_with_weights = sorted(dataset, key=lambda x: x[1], reverse=True)
                    dataset = [*dataset, *train_dataset_with_weights[:resample_count]]
        else:
            if resample_mode == 'sample':
                if len(dataset) > resample_count:
                    new_train_dataset = self.randomizers['sample'].sample(dataset, k=resample_count)
                else:
                    new_train_dataset = dataset #[*dataset, self.randomizers['sample'].choices(dataset, weights=sample_weights, k=resample_count - len(dataset))]
                dataset = new_train_dataset
        #self.randomizers['sample'].shuffle(dataset)
        return dataset

    def _train_search_plan(
        self,
        sql,
        beam_size=1,
        use_best=False,
        bushy=True,
        prob_bias=None,
    ):
        with torch.no_grad():
            bushy_suppress = self.randomizers['exploration'].random() < database.config.bushy_suppress_ratio

            new_exploration_probs = []
            best_order_detail = self.plan_manager.get(sql, detail=True)
            # the bushy node count for a left-deep plan is 1, or otherwise > 1
            best_order_bushy_count = sum(map(lambda x: type(x[0]) == str and type(x[1]) == str, best_order_detail['actions'])) \
                if best_order_detail and best_order_detail['actions'] is not None else None
            use_best = use_best and best_order_detail and (bushy or best_order_detail['is_left_deep']) \
                and best_order_detail and best_order_detail['actions'] is not None
            if use_best:
                best_order = best_order_detail['actions']
            else:
                best_order = None
            best_prev_value = best_order_detail['value'] if best_order_detail else None

            early_stop_prob = database.config.rl_early_stop_prob
            early_stop_prob = 1 - math.pow(1 - early_stop_prob, 1 / (len(sql.aliases) - 1))

            init_state = self.rl_model.plan_init(sql)

            use_baseline_as_a_path = database.config.rl_use_baseline_as_a_path and not use_best
            baseline_plans = None
            if use_baseline_as_a_path:
                baseline_detail = self.baseline_plan_manager.get(sql, detail=True)
                if not baseline_detail:
                    self.update_base_plan(sql)
                if not baseline_detail or not baseline_detail['actions'] or (not bushy and not baseline_detail['is_left_deep']):
                    use_baseline_as_a_path = False
                else:
                    baseline_order = baseline_detail['actions']
                    baseline_plan_explain = database.plan(str(sql))[0][0][0]['Plan']
                    baseline_plan : Plan = init_state
                    baseline_plans = []
                    for action in baseline_order:
                        baseline_plans.append((baseline_plan, action))
                        baseline_plan = baseline_plan.clone()
                        self.rl_model.step(baseline_plan, action)
                    baseline_plans.append((baseline_plan, None))
                    for _p, _a in baseline_plans:
                        _p.set_node_attrs_from_parsed_plan(baseline_plan_explain)

            search_plans = [self._plan_search_res(init_state, None, None, None, None, False)]
            search_paths = []
            display_records = []
            early_stop_triggered = False
            early_stop_actions = None
            while not search_plans[0].state.completed:
                step = search_plans[0].state.total_branch_nodes
                search_paths.append(search_plans)

                if use_best:
                    parent_state = search_plans[0].state
                    state = parent_state.clone()
                    self.rl_model.step(state, best_order[step])
                    search_plans = [self._plan_search_res(state, best_order[step], parent_state, 0, None, False)]

                    if self.randomizers['exploration'].random() < (1 - 0.4 ** (1 / max(len(state.sql.aliases), 6))):
                        use_best = False
                    display_records.append('b')
                elif early_stop_triggered:
                    actions = early_stop_actions.pop()
                    new_search_plans = []
                    for parent_index, (plan_search_res, action) in enumerate(zip(search_plans, actions)):
                        action = (*action[:2], Operators.default)
                        parent_state = plan_search_res.state
                        state = parent_state.clone()
                        self.rl_model.step(state, action)
                        new_search_plans.append(self._plan_search_res(state, action, parent_state, parent_index, None, False))
                    search_plans = new_search_plans
                    display_records.append('e')
                else:
                    # tips: cannot use baseline when use_best is set because the previous plans are not in previous paths
                    if step >= 1 and use_baseline_as_a_path:
                        search_plans.append(self._plan_search_res(
                            baseline_plans[step][0],
                            baseline_plans[step - 1][1],
                            baseline_plans[step - 1][0],
                            len(search_paths[-2]) - 1, # the last element of the previous search_plans
                            None,
                            False,
                        ))
                    state_candidates = map(lambda x: (x.state, x.is_exploration), search_plans)
                    search_results = self.rl_model.search(
                        state_candidates,
                        bushy=bushy,
                        beam_size=beam_size,
                        exploration=True,
                        exploration_bias=prob_bias,
                        detail=True,
                        baseline_bushy_level=best_order_bushy_count,
                        suppress_bushy=bushy_suppress,
                    )
                    new_exploration_probs.append(search_results['exploration_prob'])
                    exploration_branches = search_results['exploration_branches']
                    if exploration_branches > 0:
                        if exploration_branches >= 10:
                            display_records.append(f"({exploration_branches})")
                        else:
                            display_records.append(str(exploration_branches))
                    else:
                        display_records.append('p')

                    search_plans = []
                    for branch_index, (parent_index, parent_state, action) in enumerate(search_results['result']):
                        is_exploration = branch_index >= beam_size - exploration_branches
                        state = parent_state.clone()
                        self.rl_model.step(state, action)
                        search_plans.append(
                            self._plan_search_res(state, action, parent_state, parent_index, None, is_exploration))

                    if self.randomizers['exploration'].random() < early_stop_prob:
                        try:
                            early_stop_actions = []
                            for plan_search_res in search_plans:
                                parent_state = plan_search_res.state
                                early_stop_plan = database.plan(str(parent_state))[0][0][0]['Plan']
                                early_stop_plan = PlanParser(early_stop_plan)
                                _early_stop_actions = early_stop_plan.rest_join_orders(parent_state)
                                early_stop_actions.append(_early_stop_actions)
                            early_stop_actions = list(reversed(list(zip(*early_stop_actions))))
                        except AssertionError as e:
                            early_stop_actions = None
                            self.log(f'AssertionError: {e}', level=logging.WARNING)
                        else:
                            early_stop_triggered = True

            search_paths.append(search_plans)
        return {
            'paths': search_paths,
            'use_best': use_best,
            'prev_value': best_prev_value,
            'display_records': ''.join(display_records),
            'exploration_prob': sum(new_exploration_probs) / len(new_exploration_probs) if new_exploration_probs else self.rl_model.explorer.prob,
        }

    def _train_assign_values(
        self,
        sql,
        search_paths,
        best_prev_value=None,
    ):
        origin_value = plan_latency(sql, self.cache_manager)
        display_state_values = []
        res = {
            'history': [],
            'memory': [],
            'pair_memory': [],
            'priority_memory': [],
        }
        for this_index, search_res in enumerate(search_paths[-1]):
            if best_prev_value is None:
                timeout_tolerance = origin_value * 2.5
            else:
                timeout_tolerance = best_prev_value * 2.5
            timeout = database.timeout
            database.timeout = max(round(timeout_tolerance), 10000)
            state_value = plan_latency(search_res.state, self.cache_manager)
            database.timeout = timeout

            res['history'].append((search_res.state, state_value))
            display_state_values.append(state_value)

            search_res.value = state_value
            res['pair_memory'].append((search_res.state, state_value))

            actions = [search_res.action]
            plan_set = [search_res.parent_state]
            parent_index = search_res.parent_index
            i = 0
            while parent_index is not None:
                parent_list = search_paths[-2 - i]
                parent = parent_list[parent_index]
                parent.value = min(parent.value, state_value) if parent.value is not None else state_value
                parent_index = parent.parent_index
                if parent_index is not None:
                    actions.append(parent.action)
                    plan_set.append(parent.parent_state)
                i += 1
            res['priority_memory'].append((plan_set, state_value))

            if best_prev_value is None or state_value < best_prev_value:
                self.plan_manager.update(sql, reversed(actions), state_value)

        for search_plans in search_paths:
            for search_res in search_plans:
                if search_res.value is None or search_res.action is None:
                    continue
                res['memory'].append((search_res.state, search_res.value))

        res['rc'] = sum(display_state_values) / origin_value / len(display_state_values)
        return res

    def _check_parameter_optimization(self):
        regularization_settings = database.config.regularization_info
        if regularization_settings is not None:
            regularization_settings = sorted(regularization_settings, key=lambda x: x['epoch'])
            index = bisect_left(regularization_settings, self.epoch, key=lambda x: x['epoch'])
            if index < len(regularization_settings) and regularization_settings[index]['epoch'] == self.epoch:
                _settings = regularization_settings[index]
            elif index > 0:
                _settings = regularization_settings[index - 1]
            else:
                _settings = None
            if _settings:
                self.rl_model.set_regularization(_settings['info'])
        else:
            self.rl_model.set_regularization({
                'norm': database.config.regularization_norm_type,
                'weight': database.config.regularization_weight,
            })

    def _check_lora(self):
        lora_settings = database.config.lora_settings
        if lora_settings is not None:
            lora_settings = sorted(lora_settings, key=lambda x: x['epoch'])
            index = bisect_left(lora_settings, self.epoch, key=lambda x: x['epoch'])
            if index < len(lora_settings) and lora_settings[index]['epoch'] == self.epoch:
                _settings = lora_settings[index]
                if _settings.get('alpha', None) is not None:
                    database.config.lora_alpha = _settings['alpha']
                    self.set_lora_alpha()
                if _settings.get('rank', None) is not None:
                    database.config.lora_rank = _settings['rank']
                    self.set_lora_rank(merge=True)
                if _settings.get('model', None) is not None:
                    set_extractor = _settings['model'].get('extractor', None)
                    if set_extractor is not None:
                        self.set_lora_training(set_extractor, merge=True, parts='extractor')
                    set_transformer = _settings['model'].get('transformer', None)
                    if set_transformer is not None:
                        self.set_lora_training(set_transformer, merge=True, parts='transformer')
                if _settings.get('clear_weight', None) is not None:
                    if _settings['clear_weight']:
                        self.set_lora_clear_weight()
            elif index > 0:
                _settings = lora_settings[index - 1]
                if _settings.get('alpha', None) is not None:
                    database.config.lora_alpha = _settings['alpha']
                    self.set_lora_alpha()
                if _settings.get('model', None) is not None:
                    set_extractor = _settings['model'].get('extractor', None)
                    _i = index - 2
                    while set_extractor is None and _i >= 0:
                        set_extractor = lora_settings[_i].get('model', {}).get('extractor', None)
                    if set_extractor is None:
                        set_extractor = False
                    self.set_lora_training(set_extractor, merge=False, parts='extractor')
                    set_transformer = _settings['model'].get('transformer', None)
                    _i = index - 2
                    while set_transformer is None and _i >= 0:
                        set_transformer = lora_settings[_i].get('model', {}).get('transformer', None)
                    if set_transformer is None:
                        set_transformer = False
                    self.set_lora_training(set_transformer, merge=False, parts='transformer')
            else:
                self.set_lora_training(False, merge=False, parts='all')
            return
        if not database.config.use_lora_only:
            if database.config.lora_finetuning_extractor_start_epoch is not None:
                if self.epoch == database.config.lora_finetuning_extractor_start_epoch:
                    self.set_lora_training(True, True, parts='extractor')
                elif self.epoch > database.config.lora_finetuning_extractor_start_epoch:
                    self.set_lora_training(True, False, parts='extractor')
                else:
                    self.set_lora_training(False, False, parts='extractor')
            if database.config.lora_finetuning_transformer_start_epoch is not None:
                if self.epoch == database.config.lora_finetuning_transformer_start_epoch:
                    self.set_lora_training(True, True, parts='transformer')
                elif self.epoch > database.config.lora_finetuning_transformer_start_epoch:
                    self.set_lora_training(True, False, parts='transformer')
                else:
                    self.set_lora_training(False, False, parts='transformer')

    def _set_training_dataset(self, force=False):
        if force or self._current_training_dataset is None or self.epoch % database.config.resample_interval == 0:
            train_dataset = self._sample_dataset(self.train_dataset, self.sample_weights, self.prob_bias, database.config.resample_count)
            train_dataset = [(*d, True) for d in train_dataset]
            if self.extra_train_datasets:
                for d in self.extra_train_datasets:
                    _new_d = ((*_d, False) for _d in self._sample_dataset(d, resample_count=database.config.resample_count_extra_datasets))
                    train_dataset.extend(_new_d)

            if self.worst_training_sqls:
                worst = self.worst_training_sqls
                if database.config.use_worst_training_sql_augmentation_ratio:
                    _extra = self.randomizers['sample'].choices(worst, k=round(len(worst) * database.config.use_worst_training_sql_augmentation_ratio))
                    worst = [*worst, *_extra]
                train_dataset.extend(worst)

            self.randomizers['sample'].shuffle(train_dataset)
            self._current_training_dataset = train_dataset

    def _train_one_epoch(self):
        # reset the parameter if the reset interval is reached
        self._check_parameter_reset()

        if database.config.epoch_cache_auto_drop_timeout_interval is not None and \
                (self.epoch % database.config.epoch_cache_auto_drop_timeout_interval) == 0:
            self.cache_manager.remove_timeout_plans()
            self.cache_manager.flush()

        self._check_lora()

        self.rl_model.train_mode()
        if database.config.extractor_use_table_emb_from_epoch is not None and \
            self.epoch >= database.config.extractor_use_table_emb_from_epoch:
            self.rl_model.model_extractor.enable_table_emb(True)
        else:
            self.rl_model.model_extractor.enable_table_emb(False)

        self._set_training_dataset()
        train_dataset = self._current_training_dataset

        postfix = dict()
        gen = tqdm(train_dataset, desc=f'Epoch {self.epoch:03d}', postfix=postfix)

        bushy = database.config.bushy and self.epoch >= database.config.bushy_start_epoch
        time_dicts = []
        for sql, sql_prob_bias, is_extra_dataset in gen:
            with timer:
                use_best = self.baseline_explorer.explore()
                if self.epoch < 10:
                    beam_size = 1 + self.randomizers['exploration'].randrange(database.config.beam_width)
                else:
                    beam_size = database.config.beam_width
                search_plans_dict = self._train_search_plan(sql, beam_size, use_best, bushy, sql_prob_bias)
                search_paths = search_plans_dict['paths']
                best_prev_value = search_plans_dict['prev_value']
                display_records = search_plans_dict['display_records']
                new_exploration_prob = search_plans_dict['exploration_prob']
                if search_plans_dict['use_best']:
                    self.baseline_explorer.step()
            time_plan_search = timer.time

            with timer:
                res = self._train_assign_values(sql, search_paths, best_prev_value)
                for state, value in res['history']:
                    self.epoch_history.append((
                        self.history_type.add_memory,
                        (state, value),
                    ))
                for state, value in res['pair_memory']:
                    self.rl_model.add_pair_memory(state, value)
                if not is_extra_dataset:
                    for plan_set, value in res['priority_memory']:
                        self.rl_model.add_priority_memory(plan_set, value)
                for state, value in res['memory']:
                    self.rl_model.add_memory(state, value)
                rc = res['rc']
            time_database_execution = timer.time

            with timer:
                _backward_times = 1
                for _e, _b in database.config.backward_times:
                    if self.epoch < _e:
                        break
                    _backward_times = _b

                loss_detail = self.rl_model.train(_backward_times, epoch=self.epoch)
                self.epoch_history.append((
                    self.history_type.train,
                    (_backward_times, )
                ))
            time_train = timer.time

            loss_postfix = {
                k : (v.mean().item() if isinstance(v, torch.Tensor) else v)
                for k, v in filter(lambda x: not x[0].startswith('*'), loss_detail['loss'].items())
            }
            postfix.update(
                rc=rc,
                **loss_postfix,
                lr=self.rl_model.optim.param_groups[0]['lr'],
                #path=display_records,
                #pm=new_exploration_prob,
                #pb=self.baseline_explorer.prob,
            )
            gen.set_postfix(postfix)

            time_dicts.append({
                'plan_search': time_plan_search,
                'database_execution': time_database_execution,
                'train': time_train,
                **loss_detail['time'],
            })
        time_dict = {
            'epoch': self.epoch,
            **sum_batch(time_dicts),
        }
        self.time_records.append(time_dict)
        time_record_df = dict_list_to_dataframe(self.time_records)
        path_results = Path(database.config.path_results) / self.experiment_id
        os.makedirs(path_results, exist_ok=True)
        time_record_df.to_csv(path_results / f'time.csv', index=False)

    def _train_after_validation(self):
        pass

    def _check_parameter_reset(self):
        if (database.config.epoch_parameter_reset_interval is not None
            and database.config.epoch_parameter_reset_interval > 0):
            if (
                (database.config.epoch_parameter_reset_start_epoch is None
                    or self.epoch >= database.config.epoch_parameter_reset_start_epoch)
                and self.epoch < database.config.iteration
                and self.epoch % database.config.epoch_parameter_reset_interval == 0
            ):
                self.rl_model.reset_parameters()

    def _get_module_names_from_parts(self, parts):
        if parts == 'all':
            return ('model_extractor', 'model_transformer', 'model_lstm')
        elif parts == 'extractor':
            return ('model_extractor', )
        elif parts == 'transformer':
            return ('model_transformer', 'model_lstm')
        return ('model_extractor', 'model_transformer', 'model_lstm')

    def set_lora_training(self, mode=True, merge=False, parts='all'):
        module_names = self._get_module_names_from_parts(parts)
        if mode:
            #self.log('Using LoRA')
            for module_name in module_names:
                if hasattr(self.rl_model, module_name):
                    module = getattr(self.rl_model, module_name)
                    lora.set_lora_training(module, True, merge=merge)
        else:
            for module_name in module_names:
                if hasattr(self.rl_model, module_name):
                    module = getattr(self.rl_model, module_name)
                    lora.set_lora_training(module, False, merge=merge)
        #self.log(f'Set LoRA training mode {"ON" if mode else "OFF"}{" (merged)" if merge else ""} '
        #         f'for parts: {parts}')

    def set_lora_alpha(self, parts='all'):
        module_names = self._get_module_names_from_parts(parts)
        for module_name in module_names:
            if hasattr(self.rl_model, module_name):
                module = getattr(self.rl_model, module_name)
                lora.set_lora_alpha(module, database.config.lora_alpha)
        self.log(f'Set LoRA alpha to {database.config.lora_alpha} for parts: {parts}')

    def set_lora_rank(self, parts='all', merge: bool = False):
        module_names = self._get_module_names_from_parts(parts)
        for module_name in module_names:
            if hasattr(self.rl_model, module_name):
                module = getattr(self.rl_model, module_name)
                lora.set_lora_rank(module, database.config.lora_rank, merge=merge)
        self.rl_model.optimizer_init()
        self.rl_model.schedule(self.epoch)
        self.log(f'Set LoRA rank to {database.config.lora_rank}{" (merged)" if merge else ""} for parts: {parts}')
        self.lora_rank = database.config.lora_rank

    def set_lora_clear_weight(self, parts='all'):
        module_names = self._get_module_names_from_parts(parts)
        for module_name in module_names:
            if hasattr(self.rl_model, module_name):
                module = getattr(self.rl_model, module_name)
                lora.lora_clear_weight(module)
        self.log(f'Set parameters to 0 for parts: {parts}')

    def mark_only_lora_as_trainable(self, parts='all'):
        module_names = self._get_module_names_from_parts(parts)
        self.log('Marking only LoRA parameters as trainable')
        for module_name in module_names:
            if hasattr(self.rl_model, module_name):
                module = getattr(self.rl_model, module_name)
                loralib.mark_only_lora_as_trainable(module)

    def enable_table_learned_embeddings(self, mode: bool = True):
        self.rl_model.model_extractor.enable_table_emb(mode)


def send_email(title, message):
    if database.config.email is not None and database.config.email_password is not None:
        with smtp.login(database.config.email, database.config.email_password, ssl=True) as m:
            if m is not None:
                from_ = f'{database.config.email_product_name} | {database.config.experiment_id}'
                html_args = {
                    'title': title,
                    'product_name': database.config.email_product_name,
                    'message': message,
                }
                receiver = database.config.email_receiver if database.config.email_receiver else None
                success = smtp.mail(m, smtp.mime_from_file(title, 'html/console.html', replace=html_args, from_=from_), receiver=receiver)
            else:
                success = False
        if not success:
            print(f'Failed to send mail as {database.config.email}', file=sys.stderr)

def exception_notify(proc, args=(), kwargs=None, *, exc_type=Exception):
    def exc_type_check(exc_type):
        if not issubclass(exc_type, BaseException):
            raise TypeError("catching classes that do not inherit from BaseException is not allowed")
    if isinstance(exc_type, tuple):
        for _exc_type in exc_type:
            exc_type_check(_exc_type)
    else:
        exc_type_check(exc_type)
    if kwargs is None:
        kwargs = {}
    excepthook, tracebacklimit = sys.excepthook, getattr(sys, 'tracebacklimit', NotImplemented)
    try:
        return proc(*args, **kwargs)
    except exc_type as e:
        title = get_exception_str(e)
        traceback_head = get_traceback(e, join=False)
        traceback_last = []
        while traceback_head and not traceback_head[-1].startswith(' '):
            traceback_last.append(traceback_head.pop())
        traceback_head = py_syntax_beautify.beautify(''.join(traceback_head))
        traceback_last = py_syntax_beautify.beautify(''.join(reversed(traceback_last)))
        if hasattr(sys.stderr, 'output_record'):
            message = console_to_html.format_escape(html.escape(sys.stderr.output_record))
        else:
            message = ''
        message += console_to_html.format_escape(html.escape(traceback_head + traceback_last))
        send_email(title, message)
        print(traceback_head, file=sys.stderr, end='')
        print(traceback_last, file=sys.stderr, end='')
        def dummy_excepthook(type, value, traceback):
            sys.excepthook = excepthook
            if tracebacklimit is NotImplemented:
                if hasattr(sys, 'tracebacklimit'):
                    del sys.tracebacklimit
            else:
                sys.tracebacklimit = tracebacklimit
        sys.excepthook = dummy_excepthook
        sys.tracebacklimit = 0
        raise


def main():
    sys.stderr = capture(sys.stderr, 2 ** 20)

    os.chdir(os.path.dirname(os.path.abspath(__file__)))

    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('-d', '--dataset', nargs='+', type=str, default=['dataset/train_tpcds', 'dataset/test_tpcds'],
                        help='Training and testing dataset. When multiple datasets are taken as arguments, '
                             'the datasets before \'/\' are training dataset and the rest are testing dataset.')
    parser.add_argument('-e', '--epochs', type=int, default=60,
                        help='Total epochs.')
    parser.add_argument('-F', '--id', type=str, default=None,
                        help='File ID.')
    parser.add_argument('--fast-warm-up', action='store_true',
                        help='To warm up the database by traversing all relations.')
    parser.add_argument('--warm-up', type=int, default=None,
                        help='To warm up the database with specific iterations.')
    parser.add_argument('-S', '--seed', type=int, default=3407,
                        help='Random seed.')
    parser.add_argument('-D', '--database', type=str, default='database',
                        help='PostgreSQL database.')
    parser.add_argument('-U', '--user', type=str, default='postgres',
                        help='PostgreSQL user.')
    parser.add_argument('-P', '--password', type=str, default=None,
                        help='PostgreSQL user password.')
    parser.add_argument('--port', type=int, default=None,
                        help='PostgreSQL port.')
    parser.add_argument('--host', type=str, default=None,
                        help='PostgreSQL host.')
    parser.add_argument('--reset', action='store_true',
                        help='To ignore existing checkpoints.')
    parser.add_argument('--config', type=str, default=None,
                        help='The additional config file path.')
    parser.add_argument('--experiences', type=str, default=None,
                        help='To add initial experiences from another checkpoint.')
    parser.add_argument('--parameters', type=str, default=None,
                        help='To load initial parameters from another checkpoint.')
    parser.add_argument('--init-validate', action='store_true',
                        help='To validate before the training process.')
    parser.add_argument('--use-lora-only', action='store_true',
                        help='To use LoRA for finetuning. Only recommended with a parameter checkpoint specified.')
    parser.add_argument('--drop-timeout-cache', action='store_true',
                        help='To drop unsuccessfully executed plans in the cache before training.')
    parser.add_argument('--server-name', type=str, default=None,
                        help='The server host name for caching.')
    parser.add_argument('--max-iter-per-epoch', type=int, default=200,
                        help='The max number of queries to be explored of each epoch.')
    parser.add_argument('--use-relative', type=str, default='none', choices=('none', 'base', 'best'),
                        help='The mode of using relative ground truth values.')
    parser.add_argument('--ignore-random-state', action='store_true',
                        help='To ignore random states in checkpoints.')

    args = parser.parse_args()

    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

    database_args = {'dbname': args.database}
    if args.user is not None:
        database_args['user'] = args.user
    if args.password is not None:
        database_args['password'] = args.password
    if args.port is not None:
        database_args['port'] = args.port
    if args.host is not None:
        database_args['host'] = args.host
    if args.server_name is not None:
        database_args['hostname'] = args.server_name
    database.setup(**database_args)

    if args.config is not None:
        database.config.load_from_file(args.config)

    database.config.log_stdout = not sys.stdout.isatty()
    database.config.resample_count = args.max_iter_per_epoch
    database.config.predict_use_relative = args.use_relative
    database.config.load_random_state = not args.ignore_random_state

    if args.id is not None:
        database.config.experiment_id = args.id
    if args.seed is not None:
        database.config.seed = args.seed
    if args.epochs is not None:
        database.config.iteration = args.epochs

    default_logger = get_logger()

    if len(args.dataset) <= 1:
        raise RuntimeError('datasets should be at least 2')

    if len(args.dataset) == 2:
        train_path, test_path = args.dataset

        default_logger('Generating train set')
        train_set = load_dataset(train_path, device=device, verbose=True)
        default_logger('Generating test set')
        test_set = load_dataset(test_path, device=device, verbose=True)
        extra_train_datasets, extra_test_datasets = [], []
    else:
        train_paths, test_paths = [], []
        _found_slash = False
        for d in args.dataset:
            if d == '/':
                _found_slash = True
            elif _found_slash:
                test_paths.append(d)
            else:
                train_paths.append(d)
        if not train_paths:
            raise RuntimeError('training dataset is not specified')
        if not test_paths:
            raise RuntimeError('testing dataset is not specified')

        default_logger('Generating train set')
        train_set = load_dataset(train_paths[0], device=device, verbose=True)
        extra_train_datasets = []
        for d in train_paths[1:]:
            _train_set = load_dataset(d, device=device, verbose=True)
            extra_train_datasets.append(_train_set)
        default_logger('Generating test set')
        test_set = load_dataset(test_paths[0], device=device, verbose=True)
        extra_test_datasets = []
        for d in test_paths[1:]:
            _test_set = load_dataset(d, device=device, verbose=True)
            extra_test_datasets.append(_test_set)

    seed(database.config.seed)
    if args.fast_warm_up:
        gen = tqdm(database.schema.tables, 'Warm up')
        for table_obj in gen:
            gen.set_postfix({'name': table_obj.name})
            _sql = f'select * from {table_obj.name}'
            database.execute(_sql)
    if args.warm_up is not None:
        ds = []
        for d in (train_set, *extra_train_datasets, test_set, *extra_test_datasets):
            if len(d) > 200:
                d = random.sample(d, k=200)
            ds.extend(d)
        warm_up(ds, iterations=args.warm_up)
        seed(database.config.seed)

    config_output_file = database.config.config_file_name.format(database.config.experiment_id)
    database.config.postgresql_shared_buffer_size = database.get_settings('shared_buffers')
    database.config.postgresql_server_version = database.get_settings('server_version')
    database.config.postgresql_max_parallel_workers = database.get_settings('max_parallel_workers')
    database.config.postgresql_max_parallel_workers_per_gather = database.get_settings('max_parallel_workers_per_gather')

    os.makedirs(os.path.dirname(config_output_file), exist_ok=True)
    with open(config_output_file, 'w') as f:
        json.dump({
            'id': database.config.experiment_id,
            'config': database.config.to_dict(),
            'args': args.__dict__,
        }, f, ensure_ascii=False, indent=4)

    database.config.use_lora_only = args.use_lora_only

    def mail_stderr():
        send_email('Automatic notification', format_escape(sys.stderr.output_record))
    delay_callback.appoint(mail_stderr, interval=database.config.auto_notify_interval)

    trainer = None
    def main_proc():
        nonlocal trainer
        trainer = Trainer(
            train_set,
            test_set,
            device,
            load_checkpoint=not args.reset,
            extra_train_datasets=extra_train_datasets,
            extra_test_datasets=extra_test_datasets,
            experience_checkpoint_file=args.experiences,
            parameter_checkpoint_file=args.parameters,
        )
        if database.config.use_lora_only:
            # do not merge the parameters after loading the checkpoint
            trainer.log('Set LoRA training')
            trainer.set_lora_training(merge=False)
            trainer.mark_only_lora_as_trainable()
        if args.drop_timeout_cache:
            trainer.log('Removing timeout plans from cache')
            trainer.cache_manager.remove_timeout_plans()
        if args.init_validate:
            trainer.log('Running initial validation')
            trainer._validate(False)
        trainer.train()
    try:
        exception_notify(main_proc, exc_type=Exception)
    except Exception:
        torch.cuda.empty_cache()
        raise

if __name__ == '__main__':
    main()
