--stack_templates_generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61_17d43cd7-a4b6-35f4-b479-8fdd81bde2b5.sql
--{"gen": "combine", "time": 0.40416598320007324, "template": "generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag_question AS tq1,
account AS account,
answer AS a1,
site AS s1,
so_user AS so_user
WHERE (q1.favorite_count >= 5 AND q1.favorite_count <= 1 AND u1.downvotes <= 1 AND u1.downvotes >= 0 AND s1.site_name = 'datascience' AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND account.id = so_user.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id)
