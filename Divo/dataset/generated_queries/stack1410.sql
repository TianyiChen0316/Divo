--stack_templates_generated-190374f3-9370-4fda-9e0b-eb8b480b4def_030b575a-6a72-3ed9-b520-c2427ede2391.sql
--{"gen": "combine", "time": 2.8714587688446045, "template": "generated-190374f3-9370-4fda-9e0b-eb8b480b4def", "dataset": "stack_templates", "rows": 1157}
SELECT *
FROM badge AS b1,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'Documentation Beta' AND s1.site_name = 'superuser' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
