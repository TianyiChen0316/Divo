--stack_templates_generated-b616fcdf-ae56-4f04-a3ec-b046abe4dd9c_29be407f-2b70-3e54-92a1-e40f8176386b.sql
--{"gen": "erase", "time": 1.8621387481689453, "template": "generated-b616fcdf-ae56-4f04-a3ec-b046abe4dd9c", "dataset": "stack_templates", "rows": 3513}
SELECT *
FROM comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS so_user,
answer AS a1
WHERE (s1.site_name = 'hermeneutics' AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND c1.post_id = a1.question_id AND c1.score > q1.score)
