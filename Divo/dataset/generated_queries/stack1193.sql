--stack_templates_generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af_d5884a93-7f35-3c87-bf67-ead991548d82.sql
--{"gen": "combine", "time": 2.807788133621216, "template": "generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af", "dataset": "stack_templates", "rows": 3}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'Commentator' AND b2.name = 'Lifeboat' AND s1.site_name = 'tor' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND b2.date > b1.date + '11 months'::interval)
