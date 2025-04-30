import json
import logging

import torch
from sql_metadata import Parser
from tqdm import tqdm

from lib.tools.log import Logger

from ..Common.Cache import Cache
from ..Common.TimeStatistic import TimeStatistic
from .generateSql import SqlProduceManager
from .sqlTemplate import SqlTemplate
from .statistic import Statistic, StatisticTest
from ..config import shifted_sql_budget_ratio, shifted_space_thres, shifted_space_thres_predictor
from ..utils import json_str_to_json_obj, cal_ratio, absolute_relative_error, \
    absolute_relative_error_with_limit
from ..Plan.PlanFactory import PlanFactory

from ....core.sql_featurizer import database

SEP = '#####'

class ShiftedManager:
    def __init__(self, db: str, training_set_name, model, algo, logger=None):
        self.model = model
        self.db = db
        self.training_set_name = training_set_name
        self.statistic = Statistic(db, training_set_name, logger=logger)
        self.sql_template = SqlTemplate(self.statistic, db)
        self.sql_producer = SqlProduceManager(self.statistic, self.sql_template, db)
        self.sql_cache = Cache(db + "_sql_" + training_set_name, enable=True)
        self.sql_2_plans_cache = Cache(db + "_sql_plans_" + training_set_name, enable=True)
        self.space_evaluation_cache = Cache("space_evaluation_{}_{}_{}_cache".format(algo, db, training_set_name),
                                            enable=True)

        self.structure_sqls = None
        self.table_2_sqls = None
        self.join_keys_2_sqls = None
        self.filter_table_2_col_2_range_sqls = None

        # { sql:[[first plans],[second plans ]],...}, only use first plans
        self.sql_2_plans = {}

        self.statistic_test: StatisticTest = None

        self.delete_structure_enable = None
        self.delete_join_enable = None
        self.delete_table_enable = None
        self.delete_filter_enable = None

        self.struct_accuracy = None
        self.join_key_accuracy = None
        self.table_accuracy = None
        self.filter_accuracy = None

        if logger is None:
            logger = Logger('log', level=logging.INFO, to_stderr=True)
        elif isinstance(logger, str):
            logger = Logger(logger)
        self.logger = logger

    @classmethod
    def _is_identical_plan(cls, pg_plan: str, another_plan: str):
        if isinstance(pg_plan, str):
            pg_plan = json_str_to_json_obj(pg_plan)
        if isinstance(another_plan, str):
            another_plan = json_str_to_json_obj(another_plan)
        p1 = json.dumps(pg_plan["Plan"])
        p2 = json.dumps(another_plan["Plan"])
        return p1 == p2

    def build(self, plans, sqls):
        self._generate_sqls(plans, sqls)

        sqls = self._collect_all_sqls()
        if self.sql_2_plans_cache.exist():
            self.sql_2_plans = self.sql_2_plans_cache.read()[0]

        # self.write_sqls()
        # exit()

        self._generate_plans(sqls)
        self.sql_2_plans_cache.save([self.sql_2_plans])

        self.struct_accuracy, self.join_key_accuracy, self.table_accuracy, self.filter_accuracy = self._evaluation()
        self.table_accuracy = self.table_accuracy if self.table_accuracy > 0 else 0.5

        self.delete_structure_enable = True if self.struct_accuracy < shifted_space_thres else False
        self.delete_join_enable = True if self.join_key_accuracy < shifted_space_thres else False
        self.delete_table_enable = True if self.table_accuracy < shifted_space_thres else False
        self.delete_filter_enable = True if self.filter_accuracy < shifted_space_thres else False

        self.statistic_test = StatisticTest(self.statistic.statistic_train, self.delete_structure_enable,
                                            self.delete_join_enable,
                                            self.delete_table_enable,
                                            self.delete_filter_enable)

        # self.write_accuracy(struct_accuracy, join_key_accuracy, table_accuracy, filter_accuracy)

        # end

    def write_accuracy(self, struct_accuracy, join_key_accuracy, table_accuracy, filter_accuracy):
        with open("./unexpected_plan_accuracy.txt", "a") as f:
            line = "train_file is {}, structure is {}, join is {}, table is {}, filter is {} \n".format(
                self.training_set_name, struct_accuracy, join_key_accuracy, table_accuracy, filter_accuracy)
            f.write(line)
        exit()

    def is_filter(self, plan):
        return self.statistic_test.is_shifted(plan)

    def get_subspace_result(self, confidence=None):
        if confidence is None:
            return self.delete_structure_enable, self.delete_join_enable, self.delete_table_enable, self.delete_filter_enable
        else:
            self.statistic_test.structure_enable = delete_structure_enable = True if self.struct_accuracy < confidence else False
            self.statistic_test.join_enable = delete_join_enable = True if self.join_key_accuracy < confidence else False
            self.statistic_test.table_enable = delete_table_enable = True if self.table_accuracy < confidence else False
            self.statistic_test.filter_enable = delete_filter_enable = True if self.filter_accuracy < confidence else False

            return delete_structure_enable, delete_join_enable, delete_table_enable, delete_filter_enable

    def _evaluation(self):
        if self.space_evaluation_cache.exist():
            res = self.space_evaluation_cache.read()
            struct_accuracy = res[0]
            join_key_accuracy = res[1]
            table_accuracy = res[2]
            filter_accuracy = res[3]
        else:
            self.logger("Start evaluation")
            # structure
            struct_sqls = self._collect_structure_sqls()
            TimeStatistic.start("evaluation")
            struct_accuracy, valid_struct_sqls_count = self._evaluate_model(struct_sqls)
            TimeStatistic.end("evaluation")
            # TimeStatistic.report()
            # exit()

            join_key_sqls = self._collect_join_key_sqls()
            join_key_accuracy, valid_join_key_sqls_count = self._evaluate_model(join_key_sqls)

            table_sqls = self._collect_table_sqls()
            table_accuracy, valid_table_sqls_count = self._evaluate_model(table_sqls)

            filter_sql = self._collect_filter_sqls()
            filter_accuracy, valid_filter_sql_count = self._evaluate_model(filter_sql)

            self.space_evaluation_cache.save([struct_accuracy, join_key_accuracy, table_accuracy, filter_accuracy])

        return struct_accuracy, join_key_accuracy, table_accuracy, filter_accuracy

    def _evaluate_model(self, sqls):
        return 0., 0 #raise RuntimeError

    def _generate_sqls(self, plans, sqls):
        self.statistic.build(plans, sqls)
        if self.sql_cache.exist():
            # print("shifted sql trigger cache")
            self.logger(f"Loading generated SQLs from {self.sql_cache._get_absolute_path()}")
            res = self.sql_cache.read()
            self.structure_sqls = res[0]
            self.table_2_sqls = res[1]
            self.join_keys_2_sqls = res[2]
            self.filter_table_2_col_2_range_sqls = res[3]
            self.logger("Loaded")
        else:
            self.sql_producer.build()
            # print("generating shifted sqls")
            budget = int(len(sqls) * shifted_sql_budget_ratio / 4.0)
            # generate
            self.logger("Generating structure SQLs")
            self.structure_sqls = self.sql_producer.generate_structure_sql(budget)
            self.logger("The size of structure SQLs is {}".format(len(self.structure_sqls)))

            self.logger("Generating table SQLs")
            self.table_2_sqls = self.sql_producer.generate_shifted_table_sql(budget)
            self.logger("The size of table SQLs is {}".format(len(self.table_2_sqls)))

            self.logger("Generating join key SQLs")
            self.join_keys_2_sqls = self.sql_producer.generate_shifted_join_key_sql(budget)
            self.logger("The size of join SQLs is {}".format(len(self.join_keys_2_sqls)))

            self.logger("Generating filter SQLs")
            self.filter_table_2_col_2_range_sqls = self.sql_producer.generate_filter_sqls(budget)
            self.logger("The size of filter SQLs is {}".format(len(self.filter_table_2_col_2_range_sqls)))

            self.logger(f"Saving generated SQLs to {self.sql_cache._get_absolute_path()}")
            self.sql_cache.save(
                [self.structure_sqls, self.table_2_sqls, self.join_keys_2_sqls, self.filter_table_2_col_2_range_sqls])
            self.logger("Saved")

    def _collect_all_sqls(self):
        sqls = []
        sqls += self._collect_structure_sqls()
        sqls += self._collect_join_key_sqls()
        sqls += self._collect_table_sqls()
        sqls += self._collect_filter_sqls()
        assert len(set(sqls)) == len(sqls)
        return sqls

    def _generate_run_pg_plan(self, sql, hint=""):
        timeout = database.timeout
        database.timeout = 300000
        result = database.execute("{} EXPLAIN (ANALYZE, TIMING, VERBOSE, COSTS, SUMMARY, FORMAT JSON)".format(hint) + sql)
        database.timeout = timeout
        return json.dumps(result[0][0])

    def _to_json(self, query_result):
        return json.dumps(query_result[0][0])

    def _generate_plans(self, sqls):
        # print("generate plan and then run")
        self.logger("Getting plans for generated SQLs")
        for i, sql in tqdm(enumerate(sqls), total=len(sqls), desc='Generating plans'):
            if sql not in self.sql_2_plans:
                # if i % max(int(len(sqls) / len(sqls)), 1) == 0:
                #     print("total sql size is {}, cur is {}".format(len(sqls), i))
                try:
                    pg_plan = self._generate_run_pg_plan(sql)
                    self.sql_2_plans[sql] = [pg_plan]
                except Exception as e:
                    #print(e)
                    self.logger(f"Plan execution error: [{e.__class__.__name__}] {str(e)}")
                    self.sql_2_plans[sql] = [None]


    def _collect_structure_sqls(self):
        sqls = []
        for s in list(self.structure_sqls.values()):
            sqls += s
        return sqls

    def _collect_join_key_sqls(self):
        sqls = []
        for s in list(self.join_keys_2_sqls.values()):
            sqls += s
        return sqls

    def _collect_table_sqls(self):
        sqls = []
        for s in list(self.table_2_sqls.values()):
            sqls += s
        return sqls

    def _collect_filter_sqls(self):
        sqls = []
        for col_2_range_sqls in list(self.filter_table_2_col_2_range_sqls.values()):
            for range_sqls in list(col_2_range_sqls.values()):
                for item in range_sqls:
                    sqls += item[2]
        return sqls

    def write_sqls(self):
        i = 0
        with open("stats_generate_sqls", "w") as f:
            for sql in self.sql_2_plans.keys():
                f.write("q{}{}{}\n".format(i, SEP, sql))
                i += 1


from sql import sql_parser
from sql.plan_base import PlanBase
def get_plan_instance(db, plan_json, plan_id=None, predict=None, sql=None, plan_obj=None):
    if isinstance(sql, str):
        sql = sql_parser.SqlBase(sql_parser.parse_select(sql))
    if plan_obj is None and sql is not None:
        plan_obj = PlanBase(sql)
        try:
            parsed = sql_parser.PlanParser(plan_json['Plan'])
            for action in parsed.join_order:
                plan_obj.join(*action)
        except RuntimeError as e:
            print(f'Warning: Runtime Error: {e}')
    return PlanFactory.get_plan_instance(db, plan_json, plan_id, predict, sql, plan_obj)

class ComparatorShiftedManager(ShiftedManager):
    def _evaluate_model(self, sqls):
        if not sqls:
            return 0., 0

        all_plans = []
        for sql in sqls:
            plans = self.sql_2_plans[sql]
            if plans[0] is not None:
                plan_obj = get_plan_instance(self.db, json_str_to_json_obj(plans[0]), sql=sql)
                all_plans.append(plan_obj)

        left_plans = []
        right_plans = []

        for i in range(len(all_plans)):
            for j in range(len(all_plans)):
                if i == j: continue
                left_plans.append(all_plans[i])
                right_plans.append(all_plans[j])

        if hasattr(self.model, 'batch'):
            compare_res = self.model.batch(left_plans, right_plans)
        else:
            compare_res = None

        correct_count = 0
        for index, (plan1, plan2) in enumerate(zip(left_plans, right_plans)):
            actual_time1, actual_time2 = plan1.execution_time, plan2.execution_time
            if self._is_identical_plan(plan1.plan_json, plan2.plan_json):
                gt = 0
            else:
                gt = actual_time1 - actual_time2
            if compare_res:
                comparison = compare_res[index]
            else:
                comparison = self.model(plan1, plan2)
            correct = (gt < 0 and comparison < 0) or (gt == 0 and comparison == 0) or (gt > 0 and comparison > 0)
            if correct:
                correct_count += 1
        total_count = len(left_plans)
        acc = float(correct_count) / total_count if total_count > 0 else 0.
        return acc, total_count

class PredictorShifterManager(ShiftedManager):
    def _evaluate_model(self, sqls):
        if not sqls:
            return 0., 0

        all_plans = []
        for sql in sqls:
            plans = self.sql_2_plans[sql]
            if plans[0] is not None:
                plan_obj = get_plan_instance(self.db, json_str_to_json_obj(plans[0]), sql=sql)
                all_plans.append(plan_obj)

        if hasattr(self.model, 'batch'):
            predict_res = self.model.batch(all_plans)
        else:
            predict_res = None

        correct_count = 0
        for index, plan in enumerate(all_plans):
            actual_time = plan.execution_time
            if predict_res:
                predict = predict_res[index]
            else:
                predict = self.model(plan)
            ratio = (predict - actual_time) / actual_time
            correct = abs(ratio) < shifted_space_thres_predictor
            if correct:
                correct_count += 1
        total_count = len(all_plans)
        acc = float(correct_count) / total_count if total_count > 0 else 0.
        return acc, total_count


class LeroShiftedManager(ShiftedManager):

    def __init__(self, db: str, training_set_name, pair_model, algo):
        super().__init__(db, training_set_name, pair_model, algo)
        self.pair_model = pair_model

    def _generate_plans(self, sqls):
        super()._generate_plans(sqls)
        # self._generate_another_plans(sqls)
        # for sql in sqls:
        #         pg_plan = self._generate_run_pg_plan(sql)
        #     another_plan = self._generate_another_plans(sql, pg_plan)

    def _generate_another_plans(self, sqls):
        for i, sql in enumerate(sqls):

            pg_plan = None
            # if plan is time out, and it will be set None
            plans = self.sql_2_plans[sql]
            if len(plans) > 1:
                # exist another plan
                continue
            if plans[0] is None:
                self.sql_2_plans[sql] = [None, None]
                continue

            if i % max(int(len(sqls) / len(sqls)), 1) == 0:
                print("_generate_another_plans: total sql size is {}, cur is {}".format(len(sqls), i))
            pg_plan = plans[0]

            # select valid leading hint
            tables = Parser(sql).tables
            is_find = False
            for i in range(len(tables) - 1):
                t1 = tables[i]
                t2 = tables[i + 1]
                q = "/*+  Leading({},{}) */ EXPLAIN (VERBOSE, COSTS, SUMMARY, FORMAT JSON) ".format(t1, t2) + sql
                result = database.execute(q)
                another_plan = self._to_json(result)
                if not self._is_identical_plan(pg_plan, another_plan):
                    # run
                    is_find = True
                    try:
                        another_plan = self._generate_run_pg_plan(sql, "/*+  Leading({},{}) */".format(t1, t2))
                        self.sql_2_plans[sql] = [pg_plan, another_plan]
                    except:
                        self.sql_2_plans[sql] = [pg_plan, None]
                    break
            if not is_find:
                self.sql_2_plans[sql] = [pg_plan, None]

    def _is_identical_plan(self, pg_plan: str, another_plan: str):
        p1 = json.dumps(json_str_to_json_obj(pg_plan)["Plan"])
        p2 = json.dumps(json_str_to_json_obj(another_plan)["Plan"])
        return p1 == p2

    def _evaluate_model(self, sqls):
        if len(sqls) == 0:
            return 0, 0

        total_count = 0
        correct_count = 0
        all_plans = []
        for sql in sqls:
            plans = self.sql_2_plans[sql]
            if plans[0] is not None:
                all_plans.append(plans[0])

        left_plans = []
        right_plans = []

        for i in range(len(all_plans)):
            for j in range(i + 1, len(all_plans)):
                left_plans.append(all_plans[i])
                right_plans.append(all_plans[j])

        model_res = self._is_smaller_from_model_batch(left_plans, right_plans)
        actual_res = self._is_smaller_from_actual_batch(left_plans, right_plans)

        for i in range(0, len(model_res)):
            if model_res[i] == actual_res[i]:
                correct_count += 1

        total_count = len(model_res)

        return float(correct_count) / total_count if total_count > 0 else 0.0, total_count

    # def _evaluate_model(self, sqls):
    #     total_count = 0
    #     correct_count = 0
    #     all_plans = []
    #     for sql in sqls:
    #         plans = self.sql_2_plans[sql]
    #         if plans[0] is not None:
    #             all_plans.append(plans[0])
    #
    #     for i in range(len(all_plans)):
    #         for j in range(i + 1, len(all_plans)):
    #             p1, p2 = all_plans[i], all_plans[j]
    #             if self._is_smaller_from_model(p1, p2) == self._is_smaller_from_actual(p1, p2):
    #                 correct_count += 1
    #             total_count += 1
    #
    #     return float(correct_count) / total_count if total_count > 0 else 0.0, total_count

    def _is_smaller_from_model(self, p1, p2):
        """
        return whether the prediction time of p1 is smaller than p2's
        :param p1:
        :param p2:
        :return:
        """
        model = self.model
        features = model.to_feature([p1, p2])
        values = model.predict(features)
        if float(values[0]) <= float(values[1]):
            return True
        torch.cuda.empty_cache()
        return False

    def _is_smaller_from_model_batch(self, plans1, plans2):
        """
        return whether the prediction time of p1 is smaller than p2's
        :param p1:
        :param p2:
        :return:
        """
        model = self.model
        features1 = model.to_feature(plans1)
        features2 = model.to_feature(plans2)
        values1 = model.predict(features1)
        values2 = model.predict(features2)

        res = []
        for i in range(0, len(values1)):
            res.append(values1[i] <= values2[i])
        return res

    def _is_smaller_from_actual_batch(self, plans1, plans2):
        """
        return whether the actual time of p1 is smaller than p2's
        :param p1:
        :param p2:
        :return:
        """
        res = []

        for i in range(0, len(plans1)):
            p1 = plans1[i]
            p2 = plans2[i]
            t1 = json_str_to_json_obj(p1)["Execution Time"]
            t2 = json_str_to_json_obj(p2)["Execution Time"]
            res.append(t1 <= t2)
        return res

    def _is_smaller_from_actual(self, p1, p2):
        """
        return whether the actual time of p1 is smaller than p2's
        :param p1:
        :param p2:
        :return:
        """
        t1 = json_str_to_json_obj(p1)["Execution Time"]
        t2 = json_str_to_json_obj(p2)["Execution Time"]
        if t1 <= t2:
            return True
        return False

