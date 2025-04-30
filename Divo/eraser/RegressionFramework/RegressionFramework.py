import copy
import logging

from lib.tools.log import Logger

from .NonShiftedModel.AdaptivaGroupTree import TreeNode
from .NonShiftedModel.AdaptivePlanGroup import AdaptivePlanGroup, AdaptivePlanGroupOptimization
from .NonShiftedModel.PlansManeger import PlansManager
from .Plan.Plan import Plan
from .Plan.PlanFactory import PlanFactory
from .ShiftedPlanProducer.ShiftedManager import ShiftedManager, LeroShiftedManager
from .StaticPlanGroup import Group, StaticConfig
from .utils import flat_depth2_list

from ...core.sql_featurizer import database

class RegressionFramework:
    def __init__(self, plans, sqls, db, training_set_name, model, algo, mode, leaf_ele_min_count=5, forest=100,
                 plans_for_queries=None, logger=None):
        self._plans = plans
        self.plans_for_queries = copy.copy(plans_for_queries)
        # only used in single model
        self._sqls = sqls
        self.model = model
        self.db = db
        self.algo = algo

        if logger is None:
            logger = Logger('log', level=logging.INFO, to_stderr=True)
        elif isinstance(logger, str):
            logger = Logger(logger)
        self.logger = logger

        # static or dynamic
        self.mode = mode

        plan_idx = 0
        if plans_for_queries is not None and not isinstance(plans_for_queries[0][0], Plan):
            for i in range(len(plans_for_queries)):
                plan_objects = []
                for plan in plans_for_queries[i]:
                    plan_objects.append(self._to_plan_object(plan, plan_idx, None))
                    plan_idx += 1
                self.plans_for_queries[i] = plan_objects
            self._plans = flat_depth2_list(self.plans_for_queries)
        else:
            if not isinstance(self._plans[0], Plan):
                self._plans = self._to_plan_objects(self._plans)

        self.shifted_manager = ShiftedManager('pg', training_set_name, model, algo, logger=self.logger)

        self.iod_models = []

        self.leaf_ele_min_count = leaf_ele_min_count
        self.forest_pos = forest

    def iod_model_factory(self, min_ele_count, static_config):
        return AdaptivePlanGroup(min_ele_count=min_ele_count, static_config=static_config)

    def clear_plan_for_cal_memory(self, model: AdaptivePlanGroup):
        for group in Group.all_groups:
            group: Group = group
            group.plans = []
            group.ratios = group.ratios[0:2]
        managers = model.key_to_plan_manager.values()
        for manager in managers:
            manager: PlansManager = manager
            manager.plans = []
            manager.clear()

        for tree_node in TreeNode.tree_nodes:
            tree_node: TreeNode = tree_node
            tree_node.actions = []
        model.key_to_plan_manager = {}

    def build(self):
        self.shifted_manager.build(self._plans, self._sqls)
        self.iod_models.append(self.iod_model_factory(min_ele_count=self.leaf_ele_min_count,
                                                      static_config=StaticConfig()))
        self.iod_models.append(self.iod_model_factory(min_ele_count=self.leaf_ele_min_count,
                                                      static_config=StaticConfig(scan_type_enable=True,
                                                                                 table_name_enable=True)))
        self.iod_models.append(self.iod_model_factory(min_ele_count=self.leaf_ele_min_count,
                                                      static_config=StaticConfig(scan_type_enable=True,
                                                                                 table_name_enable=True,
                                                                                 join_type_enable=True)))
        self.iod_models.append(self.iod_model_factory(min_ele_count=self.leaf_ele_min_count,
                                                      static_config=StaticConfig(scan_type_enable=True,
                                                                                 table_name_enable=True,
                                                                                 join_type_enable=True,
                                                                                 join_key_enable=True)))
        self.iod_models.append(self.iod_model_factory(min_ele_count=self.leaf_ele_min_count,
                                                      static_config=StaticConfig(scan_type_enable=True,
                                                                                 table_name_enable=True,
                                                                                 join_type_enable=True,
                                                                                 join_key_enable=True,
                                                                                 filter_enable=True,
                                                                                 filter_col_enable=True)))
        if self.forest_pos < 5:
            self.iod_models = [self.iod_models[self.forest_pos - 1]]

        self._build_iod_model()

    def _build_iod_model(self):
        for iod_model in self.iod_models:
            iod_model.build(self._plans, self.model)

    def _to_plan_objects(self, plans, predicts=None):
        objects = []
        for i, plan in enumerate(plans):
            objects.append(self._to_plan_object(plan, i, predicts[i] if predicts is not None else None))
        return objects

    def _to_plan_object(self, plan, idx=None, predict=None):
        return PlanFactory.get_plan_instance("pg", plan, idx, predict)

    def evaluate(self, plan1, plan2=None, predict=None, ood_thres=None):
        raise RuntimeError

    def _confidence_for_new_structure(self):
        raise RuntimeError


from .ShiftedPlanProducer.ShiftedManager import ComparatorShiftedManager

def sgn(x):
    return -1 if x < 0 else (1 if x > 0 else 0)

class ComparatorRegressionFramework(RegressionFramework):
    def __init__(self, plans, sqls, db, training_set_name, model, algo="comparator", mode="static",
                 forest=100, plans_for_queries=None, disable_unseen=False, disable_see=False, logger=None):
        super().__init__(plans, sqls, db, training_set_name, model, algo, mode, forest=forest,
                         plans_for_queries=plans_for_queries, logger=logger)
        self.shifted_manager = ComparatorShiftedManager('pg', training_set_name, model, algo, logger=logger)
        self.confidence_cache = {}
        self.disable_unseen, self.disable_see = disable_unseen, disable_see

    def _build_iod_model(self):
        for iod_model in self.iod_models:
            iod_model.build(self.plans_for_queries, self.model)

    def evaluate(self, plan1, plan2=None, predict=None, ood_thres=None):
        s_delete_enable, j_delete_enable, t_delete_enable, f_delete_enable = self.shifted_manager.get_subspace_result(
            ood_thres)

        # ood
        if self.disable_unseen:
            s_delete_enable, j_delete_enable, t_delete_enable, f_delete_enable = False, False, False, False
        else:
            is_filter_1 = self.shifted_manager.is_filter(plan1)
            is_filter_2 = self.shifted_manager.is_filter(plan2)
            if is_filter_1 or is_filter_2:
                return -1
        confidences = []

        # for eliminate experiment
        if self.disable_see:
            return 1

        for i in range(len(self.iod_models)):
            g1: Group = self.iod_models[i].get_group(plan1)
            g2: Group = self.iod_models[i].get_group(plan2)

            if g1 is None or g2 is None:
                confidences.append(
                    self._choose_confidence(s_delete_enable, j_delete_enable, t_delete_enable, f_delete_enable, i))
            elif g1.size() < self.leaf_ele_min_count or g2.size() < self.leaf_ele_min_count:
                confidences.append(1.1)
            else:
                confidences.append(self._pair_group_confidence(g1, g2))

        assert len(confidences) > 0
        return float(sum(confidences)) / len(confidences)

    def _choose_confidence(self, s_delete_enable, j_delete_enable, t_delete_enable, f_delete_enable, i):
        if i == 0 and s_delete_enable:
            return -1
        elif i == 1 and t_delete_enable:
            return -1
        elif (i == 2 or i == 3) and j_delete_enable:
            return -1
        elif i == 4 and s_delete_enable and j_delete_enable and t_delete_enable and f_delete_enable:
            return -1
        return 1

    def _pair_group_confidence(self, group1: Group, group2: Group):
        is_same_group = group1.id == group2.id
        plans1 = group1.plans
        plans2 = group2.plans

        key = self.get_pair_space_key(group1.id, group2.id)
        if key in self.confidence_cache:
            return self.confidence_cache[key]

        total_count = 0
        true_count = 0
        for i, plan1 in enumerate(plans1):
            start = i + 1 if is_same_group else 0
            for j in range(start, len(plans2)):
                plan2: Plan = plans2[j]
                gt = sgn(plan1.execution_time - plan2.execution_time)
                pred = self._select(plan1, plan2)
                if gt == pred:
                    true_count += 1
                total_count += 1
        if total_count != 0:
            confidence = true_count / total_count
        else:
            confidence = 1.0

        self.confidence_cache[key] = confidence
        return confidence

    def _select(self, plan1: Plan, plan2):
        res = self.model(plan1, plan2)
        return sgn(res)

    def get_pair_space_key(self, id1, id2):
        if id1 <= id2:
            return "{}_{}".format(id1, id2)
        else:
            return "{}_{}".format(id2, id1)

class PredictorRegressionFramework(RegressionFramework):
    def build(self):
        for plan in self._plans:
            predict = self._evaluate_plan(plan)
            plan.predict = predict
        super().build()

    def evaluate(self, plan1, plan2=None, predict=None, ood_thres=None):
        is_filter = self.shifted_manager.is_filter(plan1)
        if is_filter:
            return -1
        if plan1.predict is not None:
            predict = plan1.predict
        else:
            predict = self._evaluate_plan(plan1)
        ratios = []
        for i in range(len(self.iod_models)):
            g1 : Group = self.iod_models[i].get_group(plan1)
            if g1 is None:
                continue
            if g1.size() < self.leaf_ele_min_count:
                continue
            min_r, mean_r, max_r = g1.confidence_range()
            beta = database.config.eraser_predictor_qerror_thres
            if min_r > -beta and max_r < beta:
                ratios.append(mean_r)
        if not ratios:
            #return predict if self.db == "stats" or self.db == "tpch" else -1
            return -1
        avg = sum(ratios) / len(ratios)
        return predict / (avg + 1)

    def _evaluate_plan(self, plan: Plan):
        return self.model(plan)


class LeroRegressionFramework(RegressionFramework):
    def __init__(self, plans, sqls, db, training_set_name, model, algo="lero", mode="static", config_dict=None,
                 forest=100, plans_for_queries=None):
        # {(p1.id,p2.id):latency}
        super().__init__(plans, sqls, db, training_set_name, model, algo, mode, forest=forest,
                         plans_for_queries=plans_for_queries)
        self.plans_2_predicts = {}
        self.shifted_manager = LeroShiftedManager(db, training_set_name, model, algo)
        self.config_dict = config_dict
        self.subspace_confidence = {}

    def _build_iod_model(self):
        for iod_model in self.iod_models:
            iod_model.build(self.plans_for_queries, self.model)

    def evaluate(self, plan1, plan2=None, predict=None, ood_thres=None):
        s_delete_enable, j_delete_enable, t_delete_enable, f_delete_enable = self.shifted_manager.get_subspace_result(
            ood_thres)

        # ood
        if self.config_dict is not None and self.config_dict["disable_unseen"]:
            s_delete_enable, j_delete_enable, t_delete_enable, f_delete_enable = False, False, False, False
        else:
            is_filter_1 = self.shifted_manager.is_filter(plan1)
            is_filter_2 = self.shifted_manager.is_filter(plan2)
            if is_filter_1 or is_filter_2:
                return -1
        confidences = []

        # for eliminate experiment
        if self.config_dict is not None and self.config_dict["disable_see"]:
            return 1

        for i in range(len(self.iod_models)):
            g1: Group = self.iod_models[i].get_group(plan1)
            g2: Group = self.iod_models[i].get_group(plan2)

            if g1 is None or g2 is None:
                confidences.append(
                    self._choose_confidence(s_delete_enable, j_delete_enable, t_delete_enable, f_delete_enable, i))
            elif g1.size() < self.leaf_ele_min_count or g2.size() < self.leaf_ele_min_count:
                confidences.append(1.1)
            else:
                confidences.append(self._pair_group_confidence(g1, g2))

        assert len(confidences) > 0
        return float(sum(confidences)) / len(confidences)

    def _choose_confidence(self, s_delete_enable, j_delete_enable, t_delete_enable, f_delete_enable, i):
        if i == 0 and s_delete_enable:
            return -1
        elif i == 1 and t_delete_enable:
            return -1
        elif (i == 2 or i == 3) and j_delete_enable:
            return -1
        elif i == 4 and s_delete_enable and j_delete_enable and t_delete_enable and f_delete_enable:
            return -1
        return 1

    # def iod_model_factory(self, min_ele_count, static_config):
    #     return AdaptivePlanGroupOptimization(min_ele_count=min_ele_count, static_config=static_config)

    def _pair_group_confidence(self, group1: Group, group2: Group):
        is_same_group = group1.id == group2.id
        plans1 = group1.plans
        plans2 = group2.plans

        key = self.get_pair_space_key(group1.id, group2.id)
        if key in self.subspace_confidence:
            return self.subspace_confidence[key]

        total_count = 0
        true_count = 0
        for i, plan1 in enumerate(plans1):
            start = i + 1 if is_same_group else 0
            for j in range(start, len(plans2)):
                plan2: Plan = plans2[j]
                if plan1.execution_time <= plan2.execution_time and self._select(plan1, plan2) == 0:
                    true_count += 1
                elif plan1.execution_time > plan2.execution_time and self._select(plan1, plan2) == 1:
                    true_count += 1
                total_count += 1
        if total_count != 0:
            confidence = true_count / total_count
        else:
            confidence = 1.0

        self.subspace_confidence[key] = confidence
        return confidence

    def _select(self, plan1: Plan, plan2):
        return 0 if plan1.predict <= plan2.predict else 1

    def get_pair_space_key(self, id1, id2):
        if id1 <= id2:
            return "{}_{}".format(id1, id2)
        else:
            return "{}_{}".format(id2, id1)

