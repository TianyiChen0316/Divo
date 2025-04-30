--stack_templates_generated-f0c497b7-cfc5-4c7a-a418-2d12b6476571_a3d57c10-1d7e-33c3-aaf2-9bb72a297cb4.sql
--{"gen": "erase", "time": 3.6840245723724365, "template": "generated-f0c497b7-cfc5-4c7a-a418-2d12b6476571", "dataset": "stack_templates", "rows": 50643}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS so_user
WHERE (s1.site_name = 'patents' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND so_user.account_id = u1.account_id)
