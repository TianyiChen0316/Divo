--stack_templates_generated-a370c8ca-5a97-4915-ba77-b102decb255a_82499a7c-87df-3b55-9884-08655683bdcd.sql
--{"gen": "erase", "time": 0.4887959957122803, "template": "generated-a370c8ca-5a97-4915-ba77-b102decb255a", "dataset": "stack_templates", "rows": 5218}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'tor' AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
