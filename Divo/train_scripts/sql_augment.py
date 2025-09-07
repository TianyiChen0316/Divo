import logging
import os, sys
import uuid
from pathlib import Path
import argparse
import typing
import threading
from concurrent.futures import ThreadPoolExecutor
from collections import namedtuple
from collections.abc import Iterable

import random
import json

import numpy as np
import psycopg.errors
import torch

from lib.torch.seed import seed
from lib.tools import smtp, timer
from lib.iter import DisjointSet
from lib.third_party.tqdm import Colour

from ..core.sql_featurizer import database, Sql
from ..model.train import load_dataset, SqlDataset
from ..train import warm_up, get_exception_str, get_traceback, get_logger
from ..utils.custom_tqdm import tqdm

from sql.sql_parser import ColumnRef, FromTable, MathExpr, SelectStatement, TargetTable, GroupClause, HavingClause, \
    OrderClause, Element, FuncCall, TypeCast, NullTest, BoolExpr, CaseExpr, Subquery, GroupingSet


color_cyan = Colour('cyan')
color_yellow = Colour('yellow')
color_magenta = Colour('magenta')


class ReadWriteLock:
    """
    https://stackoverflow.com/questions/16261902
    A lock object that allows many simultaneous "read locks", but
    only one "write lock." """

    def __init__(self, with_promotion=False):
        self._read_ready = threading.Condition(threading.RLock())
        self._readers = 0
        self._writers = 0
        self._promote = with_promotion
        self._readerList = []  # List of Reader thread IDs
        self._writerList = []  # List of Writer thread IDs

    def acquire_read(self):
        """ Acquire a read lock. Blocks only if a thread has
        acquired the write lock. """
        self._read_ready.acquire()
        try:
            while self._writers > 0:
                self._read_ready.wait()
            self._readers += 1
        finally:
            self._readerList.append(threading.get_ident())
            self._read_ready.release()

    def release_read(self):
        """ Release a read lock. """
        self._read_ready.acquire()
        try:
            self._readers -= 1
            if not self._readers:
                self._read_ready.notify_all()
        finally:
            self._readerList.remove(threading.get_ident())
            self._read_ready.release()

    def acquire_write(self):
        """ Acquire a write lock. Blocks until there are no
        acquired read or write locks. """
        self._read_ready.acquire()  # A re-entrant lock lets a thread re-acquire the lock
        self._writers += 1
        self._writerList.append(threading.get_ident())
        while self._readers > 0:
            # promote to write lock, only if all the readers are trying to promote to writer
            # If there are other reader threads, then wait till they complete reading
            if self._promote and threading.get_ident() in self._readerList and set(self._readerList).issubset(
                    set(self._writerList)):
                break
            else:
                self._read_ready.wait()

    def release_write(self):
        """ Release a write lock. """
        self._writers -= 1
        self._writerList.remove(threading.get_ident())
        self._read_ready.notify_all()
        self._read_ready.release()


class SqlDatasetInfo:
    def __init__(self, dataset: SqlDataset = None, unique_template=False):
        self._lock = ReadWriteLock()
        self._unique_template = unique_template

        self._path = None
        self.dataset = []
        self.tables = {}
        self.filter_predicates = {}
        self.eqjoin_predicates = {}
        self.sql_templates = set()

        self._cache_range = []
        self._sample_weights = []
        self._initial_weights = []
        self._sql_indices = {}
        self._weight_factors = []
        self._initial_weight = 1.
        if dataset:
            self.add_dataset(dataset)

    def load_filters(self, dataset_info):
        self._lock.acquire_write()
        try:
            self.filter_predicates.update({
                k : v for k, v in filter(
                    lambda x: x[0] in self.filter_predicates,
                    dataset_info.filter_predicates.items())
            })
        finally:
            self._lock.release_write()

    def sample(self, size=1, weight_factors=None, mask_function=None):
        self._lock.acquire_read()
        try:
            if not self.dataset:
                return None
            if isinstance(weight_factors, (int, float, np.ndarray)):
                pass
            elif isinstance(weight_factors, Iterable):
                weight_factors = np.array(weight_factors)
            elif callable(weight_factors):
                weight_factors = np.array([weight_factors(s) for s in self.dataset])
            else:
                weight_factors = np.array(self._weight_factors)
            sample_weights = np.array(self._sample_weights) * weight_factors
            if callable(mask_function):
                mask = np.array([1 if mask_function(s) else 0 for s in self.dataset])
                sample_weights = sample_weights * mask
            sample_weights = np.round(sample_weights, decimals=6)
            sample_weights = sample_weights / np.sum(sample_weights)
            indices = np.random.choice(self._cache_range, size=size, replace=False, p=sample_weights)
            return tuple(self.dataset[i] for i in indices)
        finally:
            self._lock.release_read()

    def sql_weight_factor(self, sql : Sql):
        return 1 / (len(sql.aliases))

    def add_sql(self, sql: Sql, parents=None, weight_split_ratio=None, weight_preserve_ratio=0.33):
        self._lock.acquire_write()
        try:
            if sql.filename in self._sql_indices:
                return
            sql_template = self.template_representation(sql)
            if self._unique_template and sql_template in self.sql_templates:
                return
            self.sql_templates.add(sql_template)
            if weight_split_ratio is None:
                weight_split_ratio = 1.
            weight_split_ratio = max(weight_split_ratio, 0.)
            self._sql_indices[sql.filename] = len(self.dataset)
            self._cache_range.append(len(self.dataset))
            self.dataset.append(sql)
            if isinstance(parents, Iterable):
                parent_indices = [self._sql_indices[p.filename] for p in parents]
            else:
                parent_indices = None
            new_sql_weight_factor = self.sql_weight_factor(sql)
            if parent_indices:
                # move parts of the parents' weights into the child node
                weight_ratio = min(weight_split_ratio / (1 + len(parent_indices)), 1.)
                total_parent_weights = 0.
                for i in parent_indices:
                    parent_weight = self._sample_weights[i]
                    parent_initial_weight = self._initial_weights[i]
                    preserved = parent_initial_weight * weight_preserve_ratio
                    split_weight = max(0, (parent_weight - preserved) * (1. - weight_ratio))
                    self._sample_weights[i] = (parent_weight - split_weight)
                    total_parent_weights += split_weight
                self._sample_weights.append(total_parent_weights)
                self._initial_weights.append(total_parent_weights)
            else:
                self._sample_weights.append(self._initial_weight)
                self._initial_weights.append(self._initial_weight)
            self._weight_factors.append(new_sql_weight_factor)
        finally:
            self._lock.release_write()

    @classmethod
    def template_representation(cls, sql: Sql):
        return ';'.join(sorted(sql.aliases)) + '#' + ';'.join(map(str, sorted(sql.join_candidates)))

    def add_dataset(self, dataset, add_table=True, add_filter=True, add_join=True):
        self._lock.acquire_write()
        try:
            if isinstance(dataset, SqlDataset):
                self._path = dataset.path
            filter_predicates = {}
            eqjoin_predicates = {}
            for sql in dataset:
                sql: Sql
                self.add_sql(sql)
                if add_table:
                    for alias, table in sql.alias_to_table.items():
                        if table.fullname not in self.tables:
                            new_from_table = FromTable()
                            new_from_table.fullname = table.fullname
                            self.tables[table.fullname] = new_from_table

                def make_columnref(old_columnref: ColumnRef):
                    nonlocal sql
                    new_columnref = ColumnRef()
                    new_columnref.column_name = old_columnref.column_name
                    new_columnref.alias = sql.alias_to_table[old_columnref.alias].fullname
                    return new_columnref

                for p in sql.filter_predicates:
                    if not isinstance(p, (MathExpr, NullTest)):
                        # it cannot be a simple filter. for example: bool expressions
                        continue
                    if p.is_simple_filter:
                        if isinstance(p, NullTest):
                            new_filter = NullTest()
                            new_filter.type = p.type
                            new_columnref = make_columnref(p.element)
                            new_filter.element = new_columnref
                        else:
                            if isinstance(p.rexpr, ColumnRef):
                                p = p.swap(inplace=False)
                            new_filter = MathExpr()
                            new_filter.kind = p.kind
                            new_filter.name = p.name
                            assert isinstance(p.lexpr, ColumnRef) and not isinstance(p.rexpr, ColumnRef)
                            new_columnref = make_columnref(p.lexpr)
                            new_filter.lexpr = new_columnref
                            # since we don't modify it, directly use the same rexpr is ok
                            new_filter.rexpr = p.rexpr
                        filter_predicates[str(new_filter)] = (new_filter, new_columnref)

                for p in sql.eqjoin_predicates:
                    if p.is_simple_eqjoin:
                        new_lexpr, new_rexpr = make_columnref(p.lexpr), make_columnref(p.rexpr)
                        if new_lexpr.alias > new_rexpr.alias \
                                or new_lexpr.alias == new_rexpr.alias and new_lexpr.column_name > new_rexpr.column_name:
                            new_lexpr, new_rexpr = new_rexpr, new_lexpr
                        new_eqjoin = MathExpr()
                        new_eqjoin.kind = p.kind
                        new_eqjoin.name = p.name
                        new_eqjoin.lexpr = new_lexpr
                        new_eqjoin.rexpr = new_rexpr
                        eqjoin_predicates[str(new_eqjoin)] = new_eqjoin

            if add_filter:
                for p, new_columnref in filter_predicates.values():
                    table_column = (new_columnref.alias, new_columnref.column_name)
                    self.filter_predicates.setdefault(table_column, []).append(p)
            if add_join:
                for p in eqjoin_predicates.values():
                    left_alias, right_alias = p.lexpr.alias, p.rexpr.alias
                    self.eqjoin_predicates.setdefault((left_alias, right_alias), []).append(p)
                    self.eqjoin_predicates.setdefault((right_alias, left_alias), []).append(p)
        finally:
            self._lock.release_write()

    def import_info(self, other, check_duplicate=True):
        if not other.dataset:
            return self

        self._lock.acquire_write()
        try:
            for fullname, from_table in other.tables.items():
                self.tables.setdefault(fullname, from_table)
            for table_column, filters in other.filter_predicates.items():
                this_filters = self.filter_predicates.setdefault(table_column, [])
                if check_duplicate:
                    dic_filters = set(str(_) for _ in this_filters)
                    for new_filter in filters:
                        if str(new_filter) not in dic_filters:
                            this_filters.append(new_filter)
                else:
                    this_filters.extend(filters)
            for table_aliases, joins in other.eqjoin_predicates.items():
                this_joins = self.eqjoin_predicates.setdefault(table_aliases, [])
                if check_duplicate:
                    dic_joins = set(str(_) for _ in this_joins)
                    for new_join in joins:
                        if str(new_join) not in dic_joins:
                            this_joins.append(new_join)
                else:
                    this_joins.extend(joins)
        finally:
            self._lock.release_write()
        return self

    @property
    def path(self):
        return self._path


class SqlAugmenter:
    SqlTuple = namedtuple('SqlTuple', ('statement', 'path', 'original_name'))

    PG_AGGR_FUNCS = frozenset((
        'array_agg', 'avg', 'bit_and', 'bit_or', 'bool_and', 'bool_or', 'count', 'every',
        'json_agg', 'jsonb_agg', 'json_object_agg', 'jsonb_object_agg', 'max', 'min',
        'string_agg', 'sum', 'xml_agg', 'corr', 'covar_pop', 'covar_samp', 'regr_avgx',
        'regr_avgy', 'regr_count', 'regr_intercept', 'regr_r2', 'regr_slope', 'regr_sxx',
        'regr_sxy', 'regr_syy', 'stddev', 'stddev_pop', 'stddev_samp', 'variance', 'var_pop',
        'var_samp', 'mode', 'percentile_cont', 'percentile_disc', 'rank', 'dense_rank',
        'percent_rank', 'cume_dist', 'grouping',
    ))

    def __init__(self, datasets: typing.Iterable[SqlDataset], /, **kwargs):
        self._init_args(kwargs)
        self.datasets_info = [SqlDatasetInfo(dataset, self.by_template) for dataset in datasets]
        self._sql_cache = set()
        if self.check_duplicates:
            for d in self.datasets_info:
                if d.dataset:
                    for sql in d.dataset:
                        self._sql_regularize(sql)
        if self.filter_datasets:
            for d in self.datasets_info:
                for fd in self.filter_datasets:
                    d.load_filters(fd)
        self._collect_sql_info()

    def _collect_sql_info(self):
        sql_costs = []
        for d in self.datasets_info:
            if d.dataset:
                for sql in d.dataset:
                    cost = database.cost(sql)
                    sql_costs.append(cost)
        self._initial_sql_costs = np.array(sql_costs)
        self._cost_limit = self._initial_sql_costs.max()
        if self.explain:
            # when explain is on, timeout indicates the tolerance factor of cost limit
            self._cost_limit = self._cost_limit * self.timeout if self.timeout is not None else None
        else:
            if self.timeout is None:
                self.timeout = 30000.

    def _init_args(self, kwargs):
        self.random_replace_filter = kwargs.get('random_replace_filter', 0.25)
        self.timeout = kwargs.get('timeout', None)
        self.least_latency = kwargs.get('least_latency', 200.)
        self.max_retries = kwargs.get('max_retries', 1000)
        self.reuse_generated = kwargs.get('reuse_generated', False)
        self.explain = kwargs.get('explain', False)
        self.check_duplicates = kwargs.get('check_duplicates', False)
        self.by_template = kwargs.get('by_template', False)
        self.output_prefix = kwargs.get('output_prefix', None)
        self.max_workers = kwargs.get('max_workers', 0)
        self.max_aliases = kwargs.get('max_aliases', 17)
        self.min_filters_ratio = kwargs.get('min_filters_ratio', None)
        filter_datasets = kwargs.get('filter_datasets', None)
        if filter_datasets:
            self.filter_datasets = [SqlDatasetInfo(dataset, self.by_template) for dataset in filter_datasets]
        else:
            self.filter_datasets = None
        experiment_id = 'sql_augment' + ('' if self.output_prefix is None else '-' + self.output_prefix) \
            if database.config.experiment_id is None else database.config.experiment_id
        self.logger = get_logger(log_file=database.config.log_file_name.format(experiment_id))

    def _sql_execute(self, sql: str):
        _timeout = database.timeout
        database.timeout = self.timeout
        try:
            with timer:
                res = database.execute(sql, retry_limit=1)
        except psycopg.errors.DatabaseError as e:
            raise
        except Exception as e:
            return None
        t = timer.time
        database.timeout = _timeout
        return res, t

    @classmethod
    def _sql_explain(cls, sql: str):
        try:
            res = database.plan(sql)
        except psycopg.errors.DatabaseError as e:
            raise
        except Exception as e:
            return None
        return res

    def random_generate(self, size: int):
        max_iterations = size + self.max_retries
        postfix = dict(
            rows='/',
            time='/',
        )
        gen = tqdm(total=size, desc='Generating SQL dataset', postfix=postfix)
        new_sqls = []
        generator = {
            'erase': lambda random_dataset: self._generate_one_from_erasing(
                random_dataset,
                random_replace_filter=self.random_replace_filter,
                return_template=True,
                max_retries=100,
            ),
            'combine': lambda random_dataset: self._generate_one_from_combining(
                random_dataset,
                self.random_replace_filter,
                return_template=True,
                num_tables_limit=4,
                max_retries=500,
            ),
        }
        generator = list(generator.items())
        for _ in range(max_iterations):
            random_dataset = random.choice(self.datasets_info)
            generator_name, generator_func = random.choice(generator)
            generated = generator_func(random_dataset)
            if generated is None:
                continue
            new_sql, sql_templates = generated
            try:
                new_sql = Sql(str(new_sql), f'generated-{str(uuid.uuid4())}', device=sql_templates[0].device)
            except Exception as e:
                self.logger(get_exception_str(e), level=logging.DEBUG)
                continue
            if len(new_sql.aliases) > self.max_aliases:
                # discard queries with too many tables
                continue
            new_sql_str = str(new_sql)
            if self.check_duplicates:
                if new_sql_str in self._sql_cache:
                    # already generated
                    continue
                self._sql_cache.add(new_sql_str)
            if self.explain:
                try:
                    res = self._sql_explain(new_sql_str)
                except psycopg.errors.DatabaseError as e:
                    self.logger(get_exception_str(e), level=logging.DEBUG)
                    database.refresh_cursor()
                    continue
                exe_time = '/'
                sql_results = None
                plan_cost = res[0][0][0]['Plan']['Total Cost']
                if self._cost_limit and plan_cost > self._cost_limit:
                    continue
            else:
                try:
                    res = self._sql_execute(new_sql_str)
                except psycopg.errors.DatabaseError as e:
                    self.logger(get_exception_str(e), level=logging.DEBUG)
                    database.refresh_cursor()
                    continue
                if res is None:
                    # time limit exceeded
                    continue
                sql_results, exe_time = res
                if exe_time < self.least_latency / 1000 or len(sql_results) == 0:
                    # not fetching any rows or the time is shorter than the limit
                    continue
            original_name = sql_templates[0].filename if sql_templates[0].filename is not None else ''
            if original_name.endswith('.sql'):
                original_name = original_name[:-4]
            comment_info = {
                'gen': generator_name,
                'time': exe_time,
                'template': original_name,
                'dataset': random_dataset.path.name,
                'rows': len(sql_results) if sql_results is not None else None,
            }
            joins = set()
            for eqjoin in new_sql.eqjoin_predicates:
                left, right = sorted(eqjoin.concerned_aliases)
                joins.add(f'{left} = {right}')
            for neqjoin in new_sql.neqjoin_predicates:
                left, right = sorted(neqjoin.concerned_aliases)
                if neqjoin.name is not None:
                    joins.add(f'{left} {neqjoin.name} {right}')
                else:
                    joins.add(f'{left} ? {right}')
            joins = sorted(joins)
            filters = sorted(map(str, new_sql.filter_predicates))
            self.logger(level=logging.DEBUG)
            self.logger(
                color_cyan.format(generator_name) + ' ' +
                color_yellow.format(f'{exe_time * 1000:.2f} ms' if isinstance(exe_time, (int, float)) else '') + ' ' +
                color_magenta.format(original_name),
                level=logging.DEBUG,
            )
            self.logger(
                f'{len(new_sql.aliases)} ' + color_cyan.format('tables') + ' ' +
                f'{len(new_sql.eqjoin_predicates + new_sql.neqjoin_predicates)} ' + color_cyan.format('joins') + ' ' +
                f'{len(new_sql.filter_predicates)} ' + color_cyan.format('filters') + ' ' +
                color_yellow.format('(') + color_yellow.format(', ').join(sorted(new_sql.aliases)) + color_yellow.format(')'),
                level=logging.DEBUG,
            )
            self.logger(
                color_cyan.format("Filters: ") + color_yellow.format(', ').join(filters),
                level=logging.DEBUG,
            )
            self.logger(
                color_cyan.format("Joins: ") + color_yellow.format(', ').join(joins),
                level=logging.DEBUG,
            )
            sql_file_str = f'--{json.dumps(comment_info, ensure_ascii=False)}\n{new_sql_str}'
            new_sqls.append(self.SqlTuple(sql_file_str, random_dataset.path, original_name))
            if self.reuse_generated:
                random_dataset : SqlDatasetInfo
                random_dataset.add_sql(new_sql, sql_templates, weight_split_ratio=1.)
            postfix.update(
                rows=len(sql_results) if sql_results is not None else '/',
                time=exe_time,
                gen=generator_name,
            )
            gen.set_postfix(postfix)
            gen.update(1)
            if len(new_sqls) >= size:
                break
        gen.close()
        return new_sqls

    @classmethod
    def _sql_regularize(cls, sql: Sql):
        # To simply sort the elements in order to find identical queries
        element: SelectStatement = sql.element
        element.from_tables = sorted(element.from_tables, key=str)
        element.from_subqueries = sorted(element.from_subqueries, key=str)
        # the order of target tables is related to the order of outputs, but it will be semantically the same so we also
        # sort it
        element.target_tables = sorted(element.target_tables, key=str)
        element.group_clauses = sorted(element.group_clauses, key=str)
        if isinstance(element.where_clause, BoolExpr):
            element.where_clause.args = sorted(element.where_clause.args, key=str)
        return sql

    @classmethod
    def _traverse_find_funccall(cls, element: Element):
        if element is None:
            return ()
        if isinstance(element, FuncCall):
            res = [element]
            for t in element.args:
                res.extend(cls._traverse_find_funccall(t))
            return tuple(res)
        if isinstance(element, MathExpr):
            targets = []
            if isinstance(element.lexpr, list):
                targets.extend(element.lexpr)
            else:
                targets.append(element.lexpr)
            if isinstance(element.rexpr, list):
                targets.extend(element.rexpr)
            else:
                targets.append(element.rexpr)
            res = []
            for t in targets:
                res.extend(cls._traverse_find_funccall(t))
            return tuple(res)
        if isinstance(element, TypeCast):
            return (cls._traverse_find_funccall(element.arg),)
        if isinstance(element, NullTest):
            return (cls._traverse_find_funccall(element.element),)
        if isinstance(element, BoolExpr):
            res = []
            for t in element.args:
                res.extend(cls._traverse_find_funccall(t))
            return tuple(res)
        if isinstance(element, CaseExpr):
            res = []
            for case in element.cases:
                res.extend(cls._traverse_find_funccall(case.result))
            return tuple(res)
        return ()

    @classmethod
    def _filter_random_replace(cls, dataset_info: SqlDatasetInfo, predicate: MathExpr, table: str = None,
                               same_kind=True):
        if not isinstance(predicate, MathExpr):
            # we do not handle null tests here
            return predicate

        assert predicate.is_simple_filter, f"'{predicate}' is not a simple filter"
        alias, column = predicate.lexpr.alias, predicate.lexpr.column_name
        if table is None:
            table = alias
        if same_kind:
            dataset_info._lock.acquire_read()
            try:
                _new_predicates = dataset_info.filter_predicates.get((table, column), ())
            finally:
                dataset_info._lock.release_read()
            if not _new_predicates:
                return predicate
            predicate_types = []
            for p in (*_new_predicates, predicate):
                if not isinstance(p, MathExpr):
                    predicate_types.append((p, -1))
                elif p.name == '=' and p.kind in (MathExpr.ARITHMETIC, MathExpr.IN):
                    # eq predicates
                    predicate_types.append((p, 1))
                elif p.kind in (MathExpr.ARITHMETIC, MathExpr.IN, MathExpr.BETWEEN, MathExpr.NOT_BETWEEN):
                    # neq predicates
                    predicate_types.append((p, 2))
                elif p.kind in (MathExpr.LIKE, MathExpr.ILIKE):
                    # str predicates
                    predicate_types.append((p, 3))
                else:
                    # other predicates
                    predicate_types.append((p, 0))
            target_type = predicate_types[-1][1]
            new_predicates = []
            for p, typ in predicate_types[:-1]:
                if typ == target_type:
                    new_predicates.append(p)
        else:
            dataset_info._lock.acquire_read()
            try:
                new_predicates = dataset_info.filter_predicates.get((table, column), ())
            finally:
                dataset_info._lock.release_read()
        if not new_predicates:
            return predicate
        picked = random.choice(new_predicates)
        new_predicate = MathExpr()
        new_predicate.kind, new_predicate.name = picked.kind, picked.name
        new_predicate.lexpr = predicate.lexpr
        new_predicate.rexpr = picked.rexpr
        return new_predicate

    def _generate_one_from_erasing(
        self,
        dataset_info: SqlDatasetInfo,
        random_replace_filter=0.0,
        return_template=False,
        num_removed_tables=None,
        removable_aliases=None,
        max_retries=100,
        sql_template: typing.Optional[Sql] = None,
        min_filters_ratio=NotImplemented,
    ):
        if min_filters_ratio is NotImplemented:
            min_filters_ratio = self.min_filters_ratio
        max_retries = max(max_retries, 1)

        if not sql_template:
            for _ in range(max_retries):
                sql_template: Sql = dataset_info.sample(1, weight_factors=1.)[0]
                num_tables = len(sql_template.alias_to_table)
                if num_tables > 3:
                    break
            if num_tables <= 3:
                return None

        if min_filters_ratio is None:
            min_filters_ratio = min(1., 0.8 * len(sql_template.filter_predicates) / len(sql_template.aliases))

        if num_removed_tables is None:
            num_removed_tables = random.randrange(1, 1 + num_tables // 3)
        removable_aliases = None if removable_aliases is None else set(removable_aliases)

        adjacent_tables = {}
        for p in sql_template.eqjoin_predicates:
            if p.is_simple_eqjoin:
                left_alias, right_alias = p.lexpr.alias, p.rexpr.alias
                adjacent_tables.setdefault(left_alias, set()).add(right_alias)
                adjacent_tables.setdefault(right_alias, set()).add(left_alias)

        num_target_tables = num_tables - num_removed_tables
        current_vertices = set()
        adjacent_valid_vertices = set()
        table_num_filters = {alias: len(filters) for alias, filters in sql_template.table_filter_predicates.items()}
        min_num_filters = round(len(sql_template.aliases) * min_filters_ratio)
        current_num_filters = 0

        def get_valid_nodes(num_target_tables):
            sorted_num_filters = sorted(table_num_filters.values(), reverse=True)
            rest = num_target_tables - len(current_vertices)
            if rest <= 0:
                return []
            target = min_num_filters - current_num_filters
            if sum(sorted_num_filters[:rest]) < target:
                return []
            thres = target - sum(sorted_num_filters[:rest - 1])
            return [alias for alias, size in filter(lambda x: x[1] >= thres, table_num_filters.items())]

        new_num_target_tables = num_target_tables
        valid_nodes = get_valid_nodes(new_num_target_tables)
        while new_num_target_tables < num_tables - 1 and not valid_nodes:
            new_num_target_tables += 1
            valid_nodes = get_valid_nodes(new_num_target_tables)
        if not valid_nodes:
            self.logger(f'Warning: no tables can be selected for sql {sql_template.filename}', level=logging.DEBUG)
            return None
        if removable_aliases is not None:
            for alias in sql_template.aliases.difference(removable_aliases):
                current_vertices.add(alias)
                adjacent_valid_vertices.update(adjacent_tables[alias])
                if alias in table_num_filters:
                    current_num_filters += table_num_filters[alias]
                    del table_num_filters[alias]
        else:
            initial_node = random.choices(valid_nodes, weights=[1. if table_num_filters.get(x, 0) == 0 else 2. for x in valid_nodes], k=1)[0]
            if initial_node in table_num_filters:
                current_num_filters = table_num_filters[initial_node]
                del table_num_filters[initial_node]
            current_vertices.add(initial_node)
            adjacent_valid_vertices.update(adjacent_tables[initial_node])
        while len(current_vertices) < num_target_tables:
            valid_nodes = get_valid_nodes(new_num_target_tables)
            adjacent_nodes = adjacent_valid_vertices - current_vertices
            while new_num_target_tables < num_tables - 1 and not adjacent_nodes.intersection(valid_nodes):
                new_num_target_tables += 1
                valid_nodes = get_valid_nodes(new_num_target_tables)
            if not valid_nodes:
                self.logger(f'Warning: no tables can be selected for sql {sql_template.filename}', level=logging.DEBUG)
                return None
            _valid_nodes = list(adjacent_nodes.intersection(valid_nodes))
            new_node = random.choices(_valid_nodes, weights=[1. if table_num_filters.get(x, 0) == 0 else 2. for x in _valid_nodes], k=1)[0]
            current_vertices.add(new_node)
            adjacent_valid_vertices.update(adjacent_tables[new_node])
        removed_tables = sql_template.aliases.difference(current_vertices)

        assert isinstance(sql_template.element, SelectStatement)
        new_sql_element = SelectStatement()
        new_sql_element.distinct = sql_template.element.distinct
        new_sql_element.limit_clause = sql_template.element.limit_clause

        for from_table in sql_template.element.from_tables:
            from_table: FromTable
            if from_table.alias in current_vertices:
                new_sql_element.from_tables.append(from_table)

        # TODO: we only process from-subqueries just like ordinary tables at present
        for from_subquery in sql_template.element.from_subqueries:
            from_subquery: Subquery
            if not (from_subquery.concerned_aliases & removed_tables):
                new_sql_element.from_subqueries.append(from_subquery)

        for group_clause in sql_template.element.group_clauses:
            group_clause: GroupClause
            if isinstance(group_clause.element, GroupingSet):
                new_group_clause = GroupClause()
                new_group_clause.element = GroupingSet()
                new_group_clause.element.kind = group_clause.element.kind
                new_group_clause.element.content = list(
                    filter(lambda x: x.alias not in removed_tables, group_clause.element.content))
                if new_group_clause.element.content:
                    new_sql_element.group_clauses.append(new_group_clause)
            else:
                if not (group_clause.concerned_aliases & removed_tables):
                    new_sql_element.group_clauses.append(group_clause)

        # if the group clauses are all removed the aggr funcs should be removed as well
        remove_aggr_funcs = not new_sql_element.group_clauses and sql_template.element.group_clauses
        removed_target_tables = []
        removed_target_names = []
        for target_table in sql_template.element.target_tables:
            target_table: TargetTable
            # does not contain removed tables
            if not (target_table.element.concerned_aliases & removed_tables):
                if remove_aggr_funcs:
                    all_funcs = self._traverse_find_funccall(target_table.element)
                    found = False
                    for func in all_funcs:
                        if func.class_name is None and func.name in self.PG_AGGR_FUNCS:
                            removed_target_tables.append(target_table)
                            found = True
                            break
                    if found:
                        continue
                new_sql_element.target_tables.append(target_table)
            else:
                if target_table.name is not None:
                    removed_target_names.append(target_table.name)
        if not new_sql_element.target_tables:
            # does not have non-func targets
            if removed_target_tables:
                new_sql_element.target_tables = removed_target_tables
                removed_target_tables = ()
            else:
                # use a star to replace the target tables
                new_sql_element.target_tables = [TargetTable.star_target()]
        for t in removed_target_tables:
            if t.name is not None:
                removed_target_names.append(t.name)

        # recheck the group clauses
        removed_target_names_columnref = set((None, name) for name in removed_target_names)
        new_group_clauses = []
        for group_clause in new_sql_element.group_clauses:
            if not (group_clause.concerned_columns & removed_target_names_columnref):
                new_group_clauses.append(group_clause)
        new_sql_element.group_clauses = new_group_clauses

        for order_clause in sql_template.element.order_clauses:
            order_clause: OrderClause
            if (not (order_clause.concerned_aliases & removed_tables)
                    and not (order_clause.concerned_columns & removed_target_names_columnref)):
                new_sql_element.order_clauses.append(order_clause)

        if (sql_template.element.having_clause
                and not (sql_template.element.having_clause.concerned_aliases & removed_tables)
                and not (sql_template.element.having_clause.concerned_columns & removed_target_names_columnref)):
            new_sql_element.having_clause = sql_template.element.having_clause

        new_where_clause = BoolExpr()
        new_where_clause.op = BoolExpr.AND
        new_where_clause.args = []
        for p in sql_template.filter_predicates:
            if not (p.concerned_aliases & removed_tables):
                if ((self.by_template or random_replace_filter and random.random() < random_replace_filter)
                        and isinstance(p, MathExpr) and p.is_simple_filter):
                    new_where_clause.args.append(
                        self._filter_random_replace(dataset_info, p, sql_template.alias_to_table[p.lexpr.alias].fullname,
                                                   same_kind=True))
                else:
                    new_where_clause.args.append(p)
        for p in (sql_template.eqjoin_predicates + sql_template.neqjoin_predicates +
                  sql_template.complicated_predicates + sql_template.constant_predicates):
            if not (p.concerned_aliases & removed_tables):
                new_where_clause.args.append(p)

        if not new_where_clause.args:
            new_sql_element.where_clause = None
        elif len(new_where_clause.args) == 1:
            new_sql_element.where_clause = new_where_clause.args[0]
        else:
            new_sql_element.where_clause = new_where_clause

        if return_template:
            return new_sql_element, (sql_template, )
        return new_sql_element

    def _generate_one_from_erasing_tarjan(
        self,
        dataset_info: SqlDatasetInfo,
        random_replace_filter=0.0,
        return_template=False,
        num_removed_tables=None,
        removable_aliases=None,
        max_retries=100,
        sql_template: typing.Optional[Sql] = None,
        min_filters_ratio=NotImplemented,
    ):
        if min_filters_ratio is NotImplemented:
            min_filters_ratio = self.min_filters_ratio
        max_retries = max(max_retries, 1)

        if not sql_template:
            for _ in range(max_retries):
                sql_template: Sql = dataset_info.sample(1, weight_factors=1.)[0]
                num_tables = len(sql_template.alias_to_table)
                if num_tables > 3:
                    break
            if num_tables <= 3:
                return None

        if min_filters_ratio is None:
            min_filters_ratio = min(1., 0.8 * len(sql_template.filter_predicates) / len(sql_template.aliases))

        if num_removed_tables is None:
            num_removed_tables = random.randrange(1, 1 + num_tables // 3)
        if removable_aliases is not None:
            removable_aliases = set()

        all_tables = set(sql_template.alias_to_table.keys())
        adjacent_tables = {}
        for p in sql_template.eqjoin_predicates:
            if p.is_simple_eqjoin:
                left_alias, right_alias = p.lexpr.alias, p.rexpr.alias
                adjacent_tables.setdefault(left_alias, set()).add(right_alias)
                adjacent_tables.setdefault(right_alias, set()).add(left_alias)
        removed_tables = set()

        def tarjan_cut_vertices(current_table, root_table):
            nonlocal timestamp
            if current_table in removed_tables:
                cut_vertices.add(current_table)
                return
            timestamp += 1
            dfs_num[current_table] = timestamp
            lowest_ancestor[current_table] = timestamp
            children = 0
            for adj in adjacent_tables[current_table]:
                if adj in removed_tables:
                    continue
                dfs_num_adj = dfs_num.get(adj, None)
                if dfs_num_adj is None:
                    tarjan_cut_vertices(adj, root_table)
                    lowest_ancestor_adj = lowest_ancestor[adj]
                    if lowest_ancestor[current_table] <= lowest_ancestor_adj:
                        if current_table != root_table:
                            cut_vertices.add(current_table)
                    else:
                        lowest_ancestor[current_table] = lowest_ancestor_adj
                    if current_table == root_table:
                        children += 1
                else:
                    lowest_ancestor[current_table] = min(lowest_ancestor[current_table], dfs_num_adj)
            if children >= 2 and current_table == root_table:
                cut_vertices.add(current_table)

        table_num_filters = {alias: len(filters) for alias, filters in sql_template.table_filter_predicates.items()}
        min_num_filters = round(len(sql_template.aliases) * min_filters_ratio)
        current_num_filters = max(0, sum(table_num_filters.values()) - min_num_filters)
        for i in range(num_removed_tables):
            dfs_num = {}
            lowest_ancestor = {}
            cut_vertices = set()
            timestamp = 0
            for table in all_tables:
                if dfs_num.get(table, None) is None:
                    tarjan_cut_vertices(table, table)
            can_be_removed = all_tables - cut_vertices
            if removable_aliases:
                can_be_removed = can_be_removed & removable_aliases
            can_be_removed = tuple(can_be_removed)
            can_be_removed = list(filter(lambda alias: table_num_filters.get(alias, 0) >= current_num_filters, can_be_removed))
            if not can_be_removed:
                self.logger(f'Warning: no tables can be removed for sql {sql_template.filename} after {i} iterations', level=logging.DEBUG)
                break
            weights = [1. if table_num_filters.get(alias, 0) > 0 else 2. for alias in can_be_removed]
            removed = random.choices(can_be_removed, weights, k=1)[0]
            current_num_filters = max(0, current_num_filters - table_num_filters.get(removed, 0))
            removed_tables.add(removed)

        if not removed_tables:
            return None

        assert isinstance(sql_template.element, SelectStatement)
        new_sql_element = SelectStatement()
        new_sql_element.distinct = sql_template.element.distinct
        new_sql_element.limit_clause = sql_template.element.limit_clause

        for from_table in sql_template.element.from_tables:
            from_table: FromTable
            if from_table.alias not in removed_tables:
                new_sql_element.from_tables.append(from_table)

        # TODO: we only process from-subqueries just like ordinary tables at present
        for from_subquery in sql_template.element.from_subqueries:
            from_subquery: Subquery
            if not (from_subquery.concerned_aliases & removed_tables):
                new_sql_element.from_subqueries.append(from_subquery)

        for group_clause in sql_template.element.group_clauses:
            group_clause: GroupClause
            if isinstance(group_clause.element, GroupingSet):
                new_group_clause = GroupClause()
                new_group_clause.element = GroupingSet()
                new_group_clause.element.kind = group_clause.element.kind
                new_group_clause.element.content = list(
                    filter(lambda x: x.alias not in removed_tables, group_clause.element.content))
                if new_group_clause.element.content:
                    new_sql_element.group_clauses.append(new_group_clause)
            else:
                if not (group_clause.concerned_aliases & removed_tables):
                    new_sql_element.group_clauses.append(group_clause)

        # if the group clauses are all removed the aggr funcs should be removed as well
        remove_aggr_funcs = not new_sql_element.group_clauses and sql_template.element.group_clauses
        removed_target_tables = []
        removed_target_names = []
        for target_table in sql_template.element.target_tables:
            target_table: TargetTable
            # does not contain removed tables
            if not (target_table.element.concerned_aliases & removed_tables):
                if remove_aggr_funcs:
                    all_funcs = self._traverse_find_funccall(target_table.element)
                    found = False
                    for func in all_funcs:
                        if func.class_name is None and func.name in self.PG_AGGR_FUNCS:
                            removed_target_tables.append(target_table)
                            found = True
                            break
                    if found:
                        continue
                new_sql_element.target_tables.append(target_table)
            else:
                if target_table.name is not None:
                    removed_target_names.append(target_table.name)
        if not new_sql_element.target_tables:
            # does not have non-func targets
            if removed_target_tables:
                new_sql_element.target_tables = removed_target_tables
                removed_target_tables = ()
            else:
                # use a star to replace the target tables
                new_sql_element.target_tables = [TargetTable.star_target()]
        for t in removed_target_tables:
            if t.name is not None:
                removed_target_names.append(t.name)

        # recheck the group clauses
        removed_target_names_columnref = set((None, name) for name in removed_target_names)
        new_group_clauses = []
        for group_clause in new_sql_element.group_clauses:
            if not (group_clause.concerned_columns & removed_target_names_columnref):
                new_group_clauses.append(group_clause)
        new_sql_element.group_clauses = new_group_clauses

        for order_clause in sql_template.element.order_clauses:
            order_clause: OrderClause
            if (not (order_clause.concerned_aliases & removed_tables)
                    and not (order_clause.concerned_columns & removed_target_names_columnref)):
                new_sql_element.order_clauses.append(order_clause)

        if (sql_template.element.having_clause
                and not (sql_template.element.having_clause.concerned_aliases & removed_tables)
                and not (sql_template.element.having_clause.concerned_columns & removed_target_names_columnref)):
            new_sql_element.having_clause = sql_template.element.having_clause

        new_where_clause = BoolExpr()
        new_where_clause.op = BoolExpr.AND
        new_where_clause.args = []
        for p in sql_template.filter_predicates:
            if not (p.concerned_aliases & removed_tables):
                if ((self.by_template or random_replace_filter and random.random() < random_replace_filter)
                        and isinstance(p, MathExpr) and p.is_simple_filter):
                    new_where_clause.args.append(
                        self._filter_random_replace(dataset_info, p, sql_template.alias_to_table[p.lexpr.alias].fullname,
                                                   same_kind=True))
                else:
                    new_where_clause.args.append(p)
        for p in (sql_template.eqjoin_predicates + sql_template.neqjoin_predicates +
                  sql_template.complicated_predicates + sql_template.constant_predicates):
            if not (p.concerned_aliases & removed_tables):
                new_where_clause.args.append(p)

        if not new_where_clause.args:
            new_sql_element.where_clause = None
        elif len(new_where_clause.args) == 1:
            new_sql_element.where_clause = new_where_clause.args[0]
        else:
            new_sql_element.where_clause = new_where_clause

        if return_template:
            return new_sql_element, (sql_template, )
        return new_sql_element

    def _generate_one_from_combining(self, dataset_info: SqlDatasetInfo, random_replace_filter=0.0,
                                     return_template=False, num_tables_limit=None, max_retries=100):
        max_retries = max(max_retries, 1)
        found = False
        for _ in range(max_retries):
            main_template = dataset_info.sample(1)[0]
            comp_template = dataset_info.sample(1, mask_function=lambda x: bool(x.aliases & main_template.aliases))[0]
            main_template: Sql
            comp_template: Sql
            common_aliases = main_template.aliases & comp_template.aliases

            #if main_template.filename.startswith('generated') or comp_template.filename.startswith('generated'):
            #    print(f'Using {main_template.filename} and {comp_template.filename}')

            if not common_aliases:
                continue
            # we force similar aliases to be all connected to prevent too large difference
            _connected = True
            for sql in (main_template, comp_template):
                ds = DisjointSet()
                for alias in common_aliases:
                    ds.add(alias)
                for p in sql.eqjoin_predicates:
                    if p.is_simple_eqjoin:
                        left_alias, right_alias = p.lexpr.alias, p.rexpr.alias
                        ds.set(left_alias, right_alias)
                if len(ds.roots()) != 1:
                    # not connected
                    _connected = False
                    break
            if not _connected:
                continue
            found = True
            break
        if not found:
            return None

        new_sql_element = SelectStatement()
        new_sql_element.target_tables = list(main_template.element.target_tables)
        new_sql_element.distinct = main_template.element.distinct
        new_sql_element.group_clauses = list(main_template.element.group_clauses)
        new_sql_element.order_clauses = list(main_template.element.order_clauses)
        new_sql_element.limit_clause = main_template.element.limit_clause
        new_sql_element.having_clause = main_template.element.having_clause
        new_sql_element.from_tables = list(main_template.element.from_tables)
        new_sql_element.from_subqueries = list(main_template.element.from_subqueries)

        comp_aliases = comp_template.aliases - common_aliases
        for from_table in comp_template.element.from_tables:
            from_table: FromTable
            if from_table.alias in comp_aliases:
                new_sql_element.from_tables.append(from_table)
        for from_subquery in comp_template.element.from_subqueries:
            from_subquery: Subquery
            if from_subquery.alias in comp_aliases:
                new_sql_element.from_subqueries.append(from_subquery)

        new_where_clause = BoolExpr()
        new_sql_element.where_clause = new_where_clause
        new_where_clause.op = BoolExpr.AND
        new_where_clause.args = []
        if main_template.element.where_clause is not None:
            if isinstance(main_template.element.where_clause, BoolExpr):
                # the where clause is specialized to be AND
                new_where_clause.args.extend(main_template.element.where_clause.args)
            else:
                new_where_clause.args.append(main_template.element.where_clause)
        if comp_template.element.where_clause is not None:
            comp_where_clause_args = comp_template.element.where_clause.args \
                if isinstance(comp_template.element.where_clause, BoolExpr) else (comp_template.element.where_clause,)
            for p in comp_where_clause_args:
                concerned_aliases = p.concerned_aliases
                if concerned_aliases & comp_aliases:
                    # not only contains common aliases
                    if isinstance(p, MathExpr) and p.is_simple_filter:
                        if self.by_template or random_replace_filter and random.random() < random_replace_filter:
                            p = self._filter_random_replace(dataset_info, p,
                                                            comp_template.alias_to_table[p.lexpr.alias].fullname,
                                                            same_kind=True)
                    new_where_clause.args.append(p)

        if num_tables_limit is not None:
            new_sql = str(new_sql_element)
            try:
                new_sql = Sql(new_sql)
            except Exception as e:
                # the new sql is invalid
                return None
            _new_sql_element = self._generate_one_from_erasing(
                dataset_info,
                random_replace_filter=0.,
                return_template=False,
                num_removed_tables=len(comp_aliases) - num_tables_limit,
                removable_aliases=comp_aliases,
                sql_template=new_sql,
            )
            if _new_sql_element is None or len(_new_sql_element.from_tables) >= num_tables_limit:
                return None

        if return_template:
            return new_sql_element, (main_template, comp_template)
        return new_sql_element


def main():
    os.chdir(Path(__file__).absolute().parent.parent)

    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('output_path', type=str,
                        help='The output path of generated SQLs.')
    parser.add_argument('-F', '--id', type=str, default=None,
                        help='File ID.')
    parser.add_argument('-d', '--dataset', nargs='+', type=str, default=[],
                        help='Datasets to be augmented.')
    parser.add_argument('--output-prefix', type=str, default=None,
                        help='The prefix of output files.')
    parser.add_argument('--filter-dataset', nargs='+', type=str, default=[],
                        help='Datasets that provide filters.')
    parser.add_argument('--warm-up', type=int, default=None,
                        help='To warm up the database with specific iterations.')
    parser.add_argument('-S', '--seed', type=int, default=3407,
                        help='Random seed.')
    parser.add_argument('-D', '--database', type=str, default='imdb',
                        help='PostgreSQL database.')
    parser.add_argument('-U', '--user', type=str, default='postgres',
                        help='PostgreSQL user.')
    parser.add_argument('-P', '--password', type=str, default=None,
                        help='PostgreSQL user password.')
    parser.add_argument('--port', type=int, default=None,
                        help='PostgreSQL port.')
    parser.add_argument('--host', type=str, default=None,
                        help='PostgreSQL host.')
    parser.add_argument('--email', nargs=2, type=str, default=None,
                        help='Auto reminder email address.')
    parser.add_argument('--total-size', type=int, default=1000,
                        help='The total number of SQLs to be generated.')
    parser.add_argument('--batch-size', type=int, default=100,
                        help='The total number of SQLs to be generated in a row.')
    parser.add_argument('--max-retries', type=int, default=1000,
                        help='The max retry limit of a batch.')
    parser.add_argument('--replace-filter', type=float, default=0.25,
                        help='The chance to replace a filter predicate to another similar expression.')
    parser.add_argument('--timeout', type=float, default=30000,
                        help='The database execution timeout limit in ms.')
    parser.add_argument('--least-latency', type=float, default=200.0,
                        help='The least database execution time of generated SQLs in ms.')
    parser.add_argument('--reuse-generated', action='store_true',
                        help='To use the generated SQLs as templates to further produce SQLs.')
    parser.add_argument('--explain', action='store_true',
                        help='To use explain instead of real execution.')
    parser.add_argument('--check-duplicates', action='store_true',
                        help='To check if the generated SQL is a duplicate.')
    parser.add_argument('--use-number-label', nargs='?', default=None, const=0, type=int,
                        help='To use numbers as file names.')
    parser.add_argument('--by-template', action='store_true',
                        help='To do template-level generation.')
    parser.add_argument('--max-aliases', type=int, default=17,
                        help='The max number of aliases in generated queries.')
    parser.add_argument('--fast-warm-up', action='store_true',
                        help='To warm up the database by traversing all relations.')

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
    database.setup(**database_args)

    database.config.experiment_id = args.id

    if args.seed is not None:
        database.config.seed = args.seed
    if args.email is not None:
        database.config.email, database.config.email_password = args.email

    dataset_paths = args.dataset

    datasets = []
    print('Generating datasets', file=sys.stderr)
    for dataset_path in dataset_paths:
        dataset = load_dataset(dataset_path, device=device, verbose=True)
        if dataset:
            datasets.append(dataset)
    filter_datasets = []
    print('Generating filter datasets', file=sys.stderr)
    for dataset_path in args.filter_dataset:
        dataset = load_dataset(dataset_path, device=device, verbose=True)
        if dataset:
            filter_datasets.append(dataset)

    if args.fast_warm_up:
        gen = tqdm(database.schema.tables, 'Warm up')
        for table_obj in gen:
            gen.set_postfix({'name': table_obj.name})
            _sql = f'select * from {table_obj.name}'
            database.execute(_sql)
    if args.warm_up is not None:
        seed(database.config.seed)
        _datasets = []
        for dataset in datasets:
            _datasets.extend(dataset)
        warm_up(_datasets, iterations=args.warm_up)

    database.config.email_product_name = 'SQL Augmentation'
    # uuid_namespace = uuid.UUID('c7bddab5-fb2d-32fe-887b-b3744ee6c3f0')
    uuid_namespace = uuid.uuid4()

    output_path = Path(args.output_path)
    os.makedirs(output_path, exist_ok=True)
    try:
        sql_generator = SqlAugmenter(
            datasets,
            random_replace_filter=args.replace_filter,
            timeout=args.timeout,
            least_latency=args.least_latency,
            max_retries=args.max_retries,
            reuse_generated=args.reuse_generated,
            explain=args.explain,
            check_duplicates=args.check_duplicates,
            filter_datasets=filter_datasets,
            by_template=args.by_template,
            output_prefix=args.output_prefix,
        )
        totals = {}
        if args.use_number_label is not None:
            sql_index = args.use_number_label
        else:
            sql_index = 0
        total_generated = 0
        while total_generated < args.total_size:
            sqls = sql_generator.random_generate(args.batch_size)
            gen = tqdm(enumerate(sqls), total=len(sqls), desc='Validating')
            for index, (stmt, path, ori_name) in gen:
                if total_generated >= args.total_size:
                    gen.close()
                    break
                timeout, database.timeout = database.timeout, args.timeout
                db_latency, plan = database.latency(stmt, return_plan=True, cache=False)
                database.timeout = timeout
                if plan is None:
                    # time limit exceeded
                    continue
                index = index + totals.setdefault(path, 0)
                new_uuid = uuid.uuid3(uuid_namespace, f"{path.name}:{hex(index)[2:]}")
                new_name = f"{path.name}_{ori_name}_{new_uuid}.sql"
                sql_index += 1
                if args.use_number_label is not None:
                    _index_name = f'{sql_index}.sql'
                    if sql_generator.output_prefix:
                        _index_name = sql_generator.output_prefix + _index_name
                    _path = output_path / _index_name
                else:
                    _path = output_path / new_name
                with open(_path, 'w') as f:
                    f.write(f'--{new_name}\n')
                    f.write(stmt)
                totals[path] += 1
                total_generated += 1
        sql_generator.logger(color_cyan.format('Done.'))
    except Exception as e:
        if database.config.email is not None and database.config.email_password is not None:
            with smtp.login(database.config.email, database.config.email_password, ssl=True) as m:
                if m is not None:
                    from_ = f'{database.config.email_product_name}'
                    title = get_exception_str(e)
                    html_args = {
                        'product_name': database.config.email_product_name,
                        'message': get_traceback(e),
                    }
                    receiver = database.config.email_receiver if database.config.email_receiver else None
                    success = smtp.mail(m,
                                        smtp.mime_from_file(title, 'html/remind.html', replace=html_args, from_=from_),
                                        receiver=receiver)
                else:
                    success = False
            if not success:
                print(f'Failed to send mail as {database.config.email}', file=sys.stderr)
        raise


if __name__ == '__main__':
    main()
