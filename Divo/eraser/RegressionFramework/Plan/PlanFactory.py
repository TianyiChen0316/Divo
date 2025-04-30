from .PgPlan import PgPlan
from .SparkPlan import SparkPlan


class PlanFactory:
    @classmethod
    def get_plan_instance(cls, db_type: str, plan_json, plan_id=None, predict=None, sql=None, plan_obj=None):
        if db_type == "spark":
            return SparkPlan(plan_json, plan_id, predict, sql, plan_obj)
        elif db_type == "pg":
            plan= PgPlan(plan_json, plan_id, predict, sql, plan_obj)
            # 注意，压缩会导致node_id_to_node 为空，需要修复这个bug
            # plan.compress()
            return plan
        else:
            raise RuntimeError

    @classmethod
    def get_plan_node_instance(cls, db_type: str, node_json, plan_id=None, predict=None):
        if db_type == "spark":
            return SparkPlan.to_node(node_json)
        elif db_type == "pg":
            return PgPlan.to_node(node_json, plan_id, predict)
        else:
            raise RuntimeError
