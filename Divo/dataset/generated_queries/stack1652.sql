--stack_templates_generated-f0c497b7-cfc5-4c7a-a418-2d12b6476571_06cc4971-34cd-3f26-96b8-e0b595dddeaf.sql
--{"gen": "erase", "time": 6.880324363708496, "template": "generated-f0c497b7-cfc5-4c7a-a418-2d12b6476571", "dataset": "stack_templates", "rows": 309387}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS so_user
WHERE (s1.site_name = 'spanish' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND so_user.account_id = u1.account_id)
