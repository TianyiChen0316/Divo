--stack_templates_generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af_ceefe8c5-0f7a-3c7a-981d-487d0994636f.sql
--{"gen": "combine", "time": 3.2680904865264893, "template": "generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af", "dataset": "stack_templates", "rows": 9}
SELECT *
FROM badge AS b1,
so_user AS so_user,
account AS account,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'Not a Robot' AND account.website_url <> '' AND s1.site_name = 'philosophy' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id)
