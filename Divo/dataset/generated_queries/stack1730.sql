--stack_templates_generated-346df119-b841-463d-9b8f-de6d29709a19_4a80abf0-8162-3eb5-846a-1664e006d9a2.sql
--{"gen": "erase", "time": 0.49267077445983887, "template": "generated-346df119-b841-463d-9b8f-de6d29709a19", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
answer AS a1,
site AS s1,
so_user AS so_user
WHERE (acc.website_url ILIKE '%code%' AND q1.favorite_count >= 1 AND q1.favorite_count <= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s1.site_name = 'lifehacks' AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND account.id = so_user.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = b1.user_id AND q1.owner_user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND account.id = acc.id AND acc.id = so_user.account_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = so_user.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = so_user.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND q1.site_id = tq1.site_id AND a1.site_id = so_user.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = tq1.site_id)
