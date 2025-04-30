--stack_templates_generated-b79355c1-1d94-4122-845e-7f0b56bbfdff_fefae231-b243-3a55-b3fa-a8327786f5c5.sql
--{"gen": "erase", "time": 4.502545356750488, "template": "generated-b79355c1-1d94-4122-845e-7f0b56bbfdff", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1
WHERE (q1.favorite_count >= 1 AND q1.favorite_count <= 1 AND u1.downvotes >= 10 AND u1.downvotes >= 0 AND account.website_url <> '' AND b1.name = 'Not a Robot' AND q1.owner_user_id = u1.id AND u1.site_id = q1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND so_user.account_id = u1.account_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id AND q1.site_id = a1.site_id)
