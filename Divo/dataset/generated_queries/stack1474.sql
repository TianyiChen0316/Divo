--stack_templates_generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61_5e504c50-d29d-3504-80bc-8e805269f614.sql
--{"gen": "combine", "time": 2.620981454849243, "template": "generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1,
so_user AS u2
WHERE (q1.favorite_count <= 5000 AND q1.favorite_count >= 5 AND u1.downvotes >= 10 AND u1.downvotes <= 10 AND account.website_url <> '' AND b1.name = 'API Evangelist' AND q1.owner_user_id = u1.id AND u1.site_id = q1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id AND q1.site_id = a1.site_id)
