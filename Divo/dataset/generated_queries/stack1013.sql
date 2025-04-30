--stack_templates_generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af_8f394878-067a-327b-b5e8-08d9262a40b8.sql
--{"gen": "combine", "time": 3.465878486633301, "template": "generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af", "dataset": "stack_templates", "rows": 360}
SELECT *
FROM badge AS b1,
so_user AS so_user,
account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'Lifeboat' AND account.website_url <> '' AND s1.site_name = 'linguistics' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND account.id = so_user.account_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
