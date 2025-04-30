--stack_templates_generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61_e730aa1d-3c10-3269-80a5-fcd7b8fb1a43.sql
--{"gen": "combine", "time": 1.362612247467041, "template": "generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag_question AS tq1,
site AS s1,
account AS account,
so_user AS so_user,
answer AS a1
WHERE (q1.favorite_count >= 5 AND q1.favorite_count >= 5 AND u1.downvotes <= 1 AND u1.downvotes <= 100000 AND s1.site_name = 'cstheory' AND account.website_url <> '' AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id)
