import random
import logging

import torch
import tqdm

from lib.torch.functional import prob_compress
from lib.torch.adaptive_batch import adaptive_batch_process
from lib.tools.log import Logger

from ..core.sql_featurizer import Sql, database
from ..model.rl import ValueBasedRL

from .RegressionFramework.Plan.Plan import Plan as EraserPlan
from .adapter.performance_test import ComparatorTest, PredictorTest

class EraserAdapter:
    def __init__(self, rl: ValueBasedRL, cache_manager=None, max_plans=10, logger=None):
        self.rl = rl
        self.cache_manager = cache_manager
        self.max_plans = max_plans
        if logger is None:
            logger = Logger('log', level=logging.INFO, to_stderr=True)
        elif isinstance(logger, str):
            logger = Logger(logger)
        self.logger = logger

    def _get_plan(self, plan: EraserPlan):
        sql_base = plan.sql
        sql = Sql(str(sql_base), filename=getattr(sql_base, 'filename', None), device=self.rl.device)
        new_plan = self.rl.plan_init(sql)
        for action in plan.plan_obj.actions:
            new_plan.join(*action)
        return new_plan

    @property
    def plan_generator(self):
        class plan_generator:
            def __init__(self, sql):
                raise NotImplementedError

            def __new__(cls, sql):
                sql_str = str(sql)
                new_sql = Sql(sql_str, filename=sql.filename, device=self.rl.device)
                plans = self.rl.get_plan(new_sql, bushy=database.config.bushy, multiple=True)
                if self.rl.is_train_mode:
                    if len(plans) >= self.max_plans:
                        return [str(plan) for plan in plans]
                    sql_key = sql.filename
                    original_plans = self.rl.pair_memory.get_values(sql_key)
                    if original_plans is not None:
                        if len(original_plans) > self.max_plans - len(plans):
                            original_plans = random.sample(original_plans, self.max_plans - len(plans))
                        return [str(plan) for plan in (*plans, *original_plans)]
                return [str(plan) for plan in plans]
        return plan_generator

    @property
    def plan_comparator(self):
        class plan_comparator:
            def __init__(self, plan1, plan2):
                raise NotImplementedError

            def __new__(cls, plan1, plan2):
                new_plan1, new_plan2 = self._get_plan(plan1), self._get_plan(plan2)
                return self.rl.compare_plan(new_plan1, new_plan2)

            @classmethod
            def batch(cls, left_plans, right_plans):
                self.rl.transformer_switch_mode(1)
                train_mode = self.rl.is_train_mode
                self.rl.eval_mode()
                left_plans, right_plans = tuple(left_plans), tuple(right_plans)
                self.logger('Recovering plans from json')
                with torch.no_grad():
                    ids = {}
                    for plan in tqdm.tqdm(left_plans + right_plans):
                        id_plan = id(plan)
                        if id_plan not in ids:
                            new_plan = self._get_plan(plan)
                            ids[id_plan] = ids[id(new_plan)] = new_plan
                left_plans, right_plans = tuple(ids[id(plan)] for plan in left_plans), tuple(ids[id(plan)] for plan in right_plans)
                indices, ids_tup = zip(*enumerate(ids.items()))
                plan_ids, plans = zip(*ids_tup)
                id_to_index = {plan_id: index for plan_id, index in zip(plan_ids, indices)}
                with torch.no_grad():
                    batch_size = database.config.batch_size
                    self.logger('Updating plan embeddings')
                    adaptive_batch_process(self.rl._batch_embedding_update, (plans, ), initial_batch_size=batch_size, verbose=True)
                    #self.rl._batch_embedding_update(plans)
                    def batch_process(plans):
                        if database.config.use_lstm:
                            _preds, regression_preds = self.rl.model_lstm.predict([
                                plan.get_root_embeddings().mean(dim=0)
                                for plan in plans
                            ])
                        else:
                            embs, _preds, regression_preds = self.rl.model_transformer([
                                plan.to_sequence()
                                for plan in plans
                            ])
                        return _preds
                    self.logger('Processing plans with adaptive batch size')
                    preds = adaptive_batch_process(batch_process, (plans, ), initial_batch_size=batch_size, verbose=True)
                preds = preds / database.config.classification_softmax_temperature
                left_indices, right_indices = [id_to_index[id(plan)] for plan in left_plans], [id_to_index[id(plan)] for plan in right_plans]
                left_preds, right_preds = preds[left_indices], preds[right_indices]
                cmp = self.rl._class_labels_comparison_vector(left_preds, right_preds, use_softmax=True)
                cmp_compressed = prob_compress(
                    cmp,
                    database.config.classification_num_classes - 1,
                    database.config.classification_prob_compress_half_size,
                )
                hist_size = (database.config.classification_max_log_value - database.config.classification_min_log_value) \
                                / database.config.classification_num_classes
                preds_cmp_value = self.rl.prob_advantage(
                    cmp_compressed,
                    -hist_size * (database.config.classification_prob_compress_half_size + 0.5),
                    hist_size * (database.config.classification_prob_compress_half_size + 0.5),
                    2 * database.config.classification_prob_compress_half_size + 1,
                    mode=database.config.classification_compare_mode,
                    softmax=False,
                )
                self.rl.train_mode(train_mode)
                return preds_cmp_value.view(-1).tolist()
        return plan_comparator

    @property
    def plan_predictor(self):
        class plan_predictor:
            def __init__(self, plan):
                raise NotImplementedError

            @classmethod
            def _predict_postprocess(cls, values):
                return self.rl._rev_value_preprocess(10 ** (values - 3))

            def __new__(cls, plan):
                new_plan = self._get_plan(plan)
                return cls._predict_postprocess(self.rl.predict_plan(new_plan, regression=True))

            @classmethod
            def batch(cls, plans):
                self.rl.transformer_switch_mode(database.config.transformer_encoder_weight)
                train_mode = self.rl.is_train_mode
                self.rl.eval_mode()
                plans = tuple(plans)
                self.logger('Recovering plans from json')
                with torch.no_grad():
                    ids = {}
                    for plan in tqdm.tqdm(plans):
                        id_plan = id(plan)
                        if id_plan not in ids:
                            new_plan = self._get_plan(plan)
                            ids[id_plan] = ids[id(new_plan)] = new_plan
                plans = tuple(ids[id(plan)] for plan in plans)
                with torch.no_grad():
                    batch_size = database.config.batch_size
                    self.logger('Updating plan embeddings')
                    adaptive_batch_process(self.rl._batch_embedding_update, (tuple(ids.values()), ), initial_batch_size=batch_size, verbose=True)
                    #self.rl._batch_embedding_update(ids.values())
                    def batch_process(plans):
                        if database.config.use_lstm:
                            preds, regression_preds = self.rl.model_lstm.predict([
                                plan.get_root_embeddings().mean(dim=0)
                                for plan in plans
                            ])
                        else:
                            embs, preds, regression_preds = self.rl.model_transformer([
                                plan.to_sequence()
                                for plan in plans
                            ])
                        return regression_preds
                    self.logger('Processing plans with adaptive batch size')
                    regression_preds = adaptive_batch_process(batch_process, (plans, ), initial_batch_size=batch_size, verbose=True)
                res = cls._predict_postprocess(regression_preds)
                self.rl.train_mode(train_mode)
                return res.view(-1).tolist()
        return plan_predictor

    def get_comparator_tester(self, train_sqls, test_sqls, confidence_thres=None, epoch=None):
        if confidence_thres is None:
            confidence_thres = database.config.eraser_comparator_confidence_thres
        return ComparatorTest(
            database,
            self.plan_generator,
            self.plan_comparator,
            train_sqls,
            test_sqls,
            confidence_thres,
            database.config.experiment_id,
            epoch=epoch,
            cache_manager=self.cache_manager,
            logger=database.config.log_name,
        )

    def get_predictor_tester(self, train_sqls, test_sqls, epoch=None):
        return PredictorTest(
            database,
            self.plan_generator,
            self.plan_predictor,
            train_sqls,
            test_sqls,
            database.config.experiment_id,
            epoch=epoch,
            cache_manager=self.cache_manager,
            logger=database.config.log_name,
        )
