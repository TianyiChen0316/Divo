import math
import os.path
import time
import typing
import logging
import functools

import pandas as pd
import tqdm
from pathlib import Path

from ..RegressionFramework.Plan.Plan import Plan
from ..RegressionFramework.Plan.PlanFactory import PlanFactory
from ..RegressionFramework.RegressionFramework import ComparatorRegressionFramework, PredictorRegressionFramework
from ..RegressionFramework.utils import flat_depth2_list

from sql import sql_parser
from sql.plan_base import PlanBase
from sql.database import Postgres
from lib.tools.log import Logger
from lib.torch.safe_save import load_pickle, save_pickle

from ...model.train import plan_latency
from ...core.sql_featurizer import database

def sgn(x):
    return -1 if x < 0 else (1 if x > 0 else 0)


class PredictKey:
    def __init__(self, id, predict_dict):
        self.id = id
        self.predict_dict = predict_dict

    def _predict_res(self, other):
        if not hasattr(other, 'id'):
            raise ValueError("invalid input")
        key = (self.id, other.id)
        if key not in self.predict_dict:
            raise KeyError(key)
        return self.predict_dict[key]

    def __lt__(self, other):
        return self._predict_res(other) < 0

    def __le__(self, other):
        return self._predict_res(other) <= 0

    def __gt__(self, other):
        return self._predict_res(other) > 0

    def __ge__(self, other):
        return self._predict_res(other) >= 0

    def __eq__(self, other):
        return self._predict_res(other) == 0

    def __ne__(self, other):
        return self._predict_res(other) != 0


class ComparatorTest:
    def __init__(
        self,
        db: Postgres,
        plan_generator: typing.Callable[[sql_parser.SqlBase], typing.Sequence[str]],
        plan_comparator: typing.Callable[[Plan, Plan], float],
        train_sqls: typing.Sequence[sql_parser.SqlBase],
        test_sqls: typing.Sequence[sql_parser.SqlBase],
        confidence_thres=0.8,
        experiment_id='comparator',
        cache_manager=None,
        epoch=None,
        logger=None,
    ):
        self.db = db
        self.plan_generator = plan_generator
        self.plan_comparator = plan_comparator
        self.train_sqls = train_sqls
        self.test_sqls = test_sqls
        self.confidence_thres = confidence_thres
        self.experiment_id = experiment_id
        self.cache_manager = cache_manager
        self.epoch = epoch

        if logger is None:
            logger = Logger('log', level=logging.INFO, to_stderr=True)
        elif isinstance(logger, str):
            logger = Logger(logger)
        self.logger = logger

        self.init_plans()
        self.add_metrics()
        self.init_regression(epoch)

    def init_plans(self):
        cache_file = Path(__file__).parent.parent.parent / \
                     f'.eraser.{self.experiment_id}.{-1 if self.epoch is None else self.epoch:03d}.plans.pkl'
        self.train_plans, self.test_plans = [], []
        if os.path.isfile(cache_file):
            self.logger(f'Loading plans from {cache_file}')
            train_plans, test_plans = load_pickle(cache_file)
            train_sql_mapping = {sql.filename: sql for sql in self.train_sqls}
            test_sql_mapping = {sql.filename: sql for sql in self.test_sqls}
            new_train_plans, new_test_plans = {}, {}
            for plans, new_plans, sql_mapping in (
                (train_plans, new_train_plans, train_sql_mapping),
                (test_plans, new_test_plans, test_sql_mapping),
            ):
                for _plans in plans:
                    sql = sql_mapping[_plans[0].sql.filename]
                    new_plans[sql.filename] = _plans
            for plan_list, plan_mapping, sqls in (
                (self.train_plans, new_train_plans, self.train_sqls),
                (self.test_plans, new_test_plans, self.test_sqls),
            ):
                for sql in sqls:
                    plan_list.append(plan_mapping[sql.filename])
        else:
            plan_id = 0
            def get_plan_id():
                nonlocal plan_id
                res = plan_id
                plan_id += 1

                return res

            self.logger('Collecting plans')
            def _plan_latency(sql: str):
                latency_detail = plan_latency(sql, self.cache_manager, detail=True)
                plan, latency = latency_detail['plan'], latency_detail['latency']
                if plan is None:
                    plan = self.db.plan(sql)[0][0][0]
                else:
                    plan = {'Plan': plan}
                plan['Execution Time'] = latency
                return plan

            for plan_list, sqls in (
                (self.train_plans, self.train_sqls),
                (self.test_plans, self.test_sqls),
            ):
                for sql in tqdm.tqdm(sqls, 'Collecting'):
                    base_plan_dict = _plan_latency(str(sql))
                    base_plan_parsed = sql_parser.PlanParser(base_plan_dict['Plan'])
                    base_plan_obj = PlanBase(sql)
                    for action in base_plan_parsed.join_order:
                        base_plan_obj.join(*action)
                    generated_plan_hints = self.plan_generator(sql)
                    base_plan = PlanFactory.get_plan_instance("pg", base_plan_dict, plan_id=get_plan_id(), sql=sql,
                                                              plan_obj=base_plan_obj)
                    generated_plans = []
                    for generated_plan_hint in generated_plan_hints:
                        if isinstance(generated_plan_hint, dict):
                            generated_plan_dict = generated_plan_hint
                        else:
                            generated_plan_dict = _plan_latency(str(generated_plan_hint))
                        generated_plan_parsed = sql_parser.PlanParser(generated_plan_dict['Plan'])
                        generated_plan_obj = PlanBase(sql)
                        try:
                            for action in generated_plan_parsed.join_order:
                                generated_plan_obj.join(*action)
                        except (ValueError, IndexError) as e:
                            self.logger(f'{e.__class__.__name__}: {e}', level=logging.WARNING)
                            self.logger(f'SQL: {sql.filename}', level=logging.WARNING)
                            self.logger(f'Join order: {generated_plan_parsed.join_order}')
                            continue
                        generated_plan = PlanFactory.get_plan_instance("pg", generated_plan_dict, plan_id=get_plan_id(), sql=sql, plan_obj=generated_plan_obj)
                        generated_plans.append(generated_plan)
                    plan_list.append((base_plan, *generated_plans))
            if self.cache_manager:
                self.cache_manager.flush()
            self.logger('Collected')
            save_pickle([self.train_plans, self.test_plans], cache_file)

    def _legacy_add_metrics(self):
        for train_plans in self.train_plans:
            correct, total = 0, 0
            predict_res = {}
            for i in range(len(train_plans)):
                plan_i : Plan = train_plans[i]
                for j in range(len(train_plans)):
                    #if i == j: continue
                    plan_j = train_plans[j]
                    predict = self.plan_comparator(plan_i, plan_j)
                    predict_res[plan_i.plan_id, plan_j.plan_id] = predict
                    real = plan_i.execution_time - plan_j.execution_time
                    # todo: why?
                    if predict <= 0 and real <= 0:
                        correct += 1
                    total += 1
                plan_i.metric = plan_i.plan_json["metric"] = correct / total if total > 0 else 0.5
                plan_i.predict = plan_i.plan_json["predict"] = PredictKey(plan_i.plan_id, predict_res)

    def add_metrics(self):
        self.logger('Adding metrics')
        if hasattr(self.plan_comparator, 'batch'):
            self.logger('Collecting predictions')
            targets = []
            target_indices = []
            for index, train_plans in tqdm.tqdm(enumerate(self.train_plans), total=len(self.train_plans)):
                for i in range(len(train_plans)):
                    plan_i: Plan = train_plans[i]
                    for j in range(len(train_plans)):
                        plan_j = train_plans[j]
                        target_indices.append((index, i, j))
                        targets.append((plan_i, plan_j))
            left_input, right_input = zip(*targets)
            preds = self.plan_comparator.batch(left_input, right_input)
            preds = {indices: pred for indices, pred in zip(target_indices, preds)}
            def plan_comparator(index, i, j):
                return preds[index, i, j]
        else:
            def plan_comparator(index, i, j):
                train_plans = self.train_plans[index]
                plan_i, plan_j = train_plans[i], train_plans[j]
                return self.plan_comparator(plan_i, plan_j)
        gen = tqdm.tqdm(enumerate(self.train_plans), total=len(self.train_plans), desc='Processing')
        for index, train_plans in gen:
            predict_res = {}
            for i in range(len(train_plans)):
                correct, total = 0, 0
                plan_i : Plan = train_plans[i]
                for j in range(len(train_plans)):
                    plan_j = train_plans[j]
                    predict = plan_comparator(index, i, j)
                    predict_res[plan_i.plan_id, plan_j.plan_id] = predict
                    real = plan_i.execution_time - plan_j.execution_time
                    if sgn(predict) == sgn(real):
                        correct += 1
                    total += 1
                confidence = correct / total if total > 0 else database.config.eraser_comparator_default_confidence
                gen.set_postfix({'metric': f'{confidence * 100:.02f}%'})
                plan_i.metric = plan_i.plan_json["metric"] = confidence
                plan_i.predict = plan_i.plan_json["predict"] = PredictKey(plan_i.plan_id, predict_res)

    def init_regression(self, epoch=None):
        self.logger('Build regression model')
        self.regression_framework = ComparatorRegressionFramework(
            plans=flat_depth2_list(self.train_plans),
            sqls=list(map(str, self.train_sqls)),
            db='custom',
            training_set_name=f'training_{self.experiment_id}' + ('' if epoch is None else f'_{epoch:03d}'),
            model=self.plan_comparator,
            algo='custom',
            mode='dynamic',
            plans_for_queries=self.train_plans,
            logger=self.logger,
        )
        self.regression_framework.build()
        self.logger('Built')

    def select_plan(self, plans: typing.Iterable[Plan], thres=None, ood_thres=None):
        if thres is None:
            thres = self.confidence_thres
        if not isinstance(plans, (tuple, list)):
            plans = list(plans)
        confidence_counts = []
        for i in range(len(plans)):
            plan1 = plans[i]
            confidence_count = 0
            for j in range(len(plans)):
                if i == j:
                    continue
                plan2 = plans[j]
                confidence = self.regression_framework.evaluate(plan1, plan2, ood_thres=ood_thres)
                if confidence >= thres:
                    confidence_count += 1
            confidence_counts.append(confidence_count)
        def cmp(x, y):
            x, y = x[1], y[1]
            if x[0] != y[0]:
                return -(x[0] - y[0])
            return self.plan_comparator(x[1], y[1])
        sorted_plans = sorted(list(enumerate(zip(confidence_counts, plans))), key=functools.cmp_to_key(cmp))
        best_plan_index, (best_count, best_plan) = sorted_plans[0]
        if best_count == confidence_counts[0]:
            best_plan_index = 0
        return best_plan_index

    def evaluate_key(self):
        return functools.cmp_to_key(self.plan_comparator)

    def evaluate(self):
        #self.init_regression(self.epoch)
        all_res = {}
        for desc, plans, sqls in (
            ('testing', self.test_plans, self.test_sqls),
            ('training', self.train_plans, self.train_sqls),
        ):
            res = []
            for candidate_plans, sql in zip(plans, sqls):
                candidate_plans_by_model = sorted(candidate_plans, key=self.evaluate_key())
                candidate_plans_gt = sorted(candidate_plans, key=lambda x: x.plan_json['Execution Time'])
                predicted_plan_index = self.select_plan(candidate_plans)
                predicted_plan = candidate_plans[predicted_plan_index]
                model_selected_plan = candidate_plans_by_model[0]
                pg_plan = candidate_plans[0]
                best_plan = candidate_plans_gt[0]
                latency, base_latency = predicted_plan.plan_json['Execution Time'], pg_plan.plan_json['Execution Time']
                model_latency = model_selected_plan.plan_json['Execution Time']
                best_latency = best_plan.plan_json['Execution Time']
                res.append((
                    sql.filename, latency, base_latency, model_latency, best_latency,
                    predicted_plan.plan_obj.hints(), pg_plan.plan_obj.hints(), model_selected_plan.plan_obj.hints(), best_plan.plan_obj.hints(),
                    latency <= model_latency,
                ))
            columns = ('file', 'latency', 'base', 'ori', 'best', 'hint', 'base_hint', 'ori_hint', 'best_hint', 'correct')
            res = pd.DataFrame({k : v for k, v in zip(columns, zip(*res))})
            res['relative'] = res['latency'] / res['base']
            res['ori_relative'] = res['ori'] / res['base']
            acc = res['correct'].map(lambda x: 1. if x else 0.).mean()
            speedup = res['base'].sum() / res['latency'].sum()
            gmrl = math.exp(res['relative'].map(math.log).mean())
            self.logger(f'{desc.capitalize()} Speedup: {speedup:.03f}, GMRL: {gmrl:.03f}')
            all_res[desc] = {
                'data': res,
                'speedup': speedup,
                'gmrl': gmrl,
                'acc': acc,
            }
        return all_res

class PredictorTest(ComparatorTest):
    def __init__(
        self,
        db: Postgres,
        plan_generator: typing.Callable[[sql_parser.SqlBase], typing.Sequence[str]],
        plan_comparator: typing.Callable[[Plan], float],
        train_sqls: typing.Sequence[sql_parser.SqlBase],
        test_sqls: typing.Sequence[sql_parser.SqlBase],
        experiment_id='comparator',
        cache_manager=None,
        epoch=None,
        logger=None,
    ):
        super().__init__(db, plan_generator, plan_comparator, train_sqls, test_sqls, experiment_id=experiment_id, cache_manager=cache_manager, epoch=epoch, logger=logger)

    def init_regression(self, epoch=None):
        self.regression_framework = PredictorRegressionFramework(
            plans=flat_depth2_list(self.train_plans),
            sqls=list(map(str, self.train_sqls)),
            db='custom',
            training_set_name=f'training_{self.experiment_id}' + ('' if epoch is None else f'_{epoch:03d}'),
            model=self.plan_comparator,
            algo='custom',
            mode='dynamic',
            plans_for_queries=self.train_plans,
            logger=self.logger,
        )
        self.regression_framework.build()

    def add_metrics(self):
        self.logger('Adding metrics')
        if hasattr(self.plan_comparator, 'batch'):
            self.logger('Collecting predictions')
            targets, target_indices = [], []
            for index, train_plans in tqdm.tqdm(enumerate(self.train_plans), total=len(self.train_plans)):
                targets.extend(train_plans)
                target_indices.extend((index, i) for i in range(len(train_plans)))
            preds = self.plan_comparator.batch(targets)
            preds = {indices: pred for indices, pred in zip(target_indices, preds)}
            def plan_predictor(index, i):
                return preds[index, i]
        else:
            def plan_predictor(index, i):
                return self.plan_comparator(self.train_plans[index][i])
        gen = tqdm.tqdm(enumerate(self.train_plans), total=len(self.train_plans), desc='Processing')
        for index, train_plans in gen:
            for i, plan in enumerate(train_plans):
                predict = plan_predictor(index, i)
                if predict is None:
                    predict = -100
                real = plan.execution_time
                relative_error = (predict - real) / real
                gen.set_postfix({'metric': f'{relative_error:.03f}'})
                plan.metric = plan.plan_json["metric"] = relative_error
                plan.predict = plan.plan_json["predict"] = predict

    def evaluate_key(self):
        return self.plan_comparator

    def select_plan(self, plans: typing.Iterable[Plan], thres=None, ood_thres=None):
        if not isinstance(plans, (tuple, list)):
            plans = list(plans)
        confidences = []
        for index, plan in enumerate(plans):
            predicted_latency = self.plan_comparator(plan)
            plan.predict = predicted_latency
            confidence = self.regression_framework.evaluate(plan)
            confidences.append((confidence, index, plan))
        def cmp(x, y):
            if x[0] != y[0]:
                return -(x[0] - y[0])
            return x[2].predict - y[2].predict
        selected = sorted(confidences, key=functools.cmp_to_key(cmp))[0]
        if selected[0] == confidences[0][0]:
            selected_index = 0
        else:
            selected_index = selected[1]
        return selected_index
