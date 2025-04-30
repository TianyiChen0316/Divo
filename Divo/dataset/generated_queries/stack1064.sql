--stack_templates_generated-b598911c-104c-4b3b-b46a-3d989a19aadb_c5ebd40e-1227-35ea-8c75-a9eec28944bc.sql
--{"gen": "combine", "time": 0.3318808078765869, "template": "generated-b598911c-104c-4b3b-b46a-3d989a19aadb", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
comment AS c1,
site AS s1
WHERE (account.website_url <> '' AND b1.name = 'Publicist' AND b2.name = 'Legendary' AND q1.favorite_count >= 1 AND q1.favorite_count >= 5 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s1.site_name = 'vegetarianism' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = c1.post_id AND t1.site_id = c1.site_id AND u1.site_id = s1.site_id AND u1.site_id = c1.site_id AND b1.site_id = s1.site_id AND b1.site_id = c1.site_id AND b2.site_id = s1.site_id AND b2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND s1.site_id = so_user.site_id AND s1.site_id = c1.site_id AND so_user.site_id = c1.site_id AND b2.date > b1.date + '11 months'::interval AND c1.score > q1.score)
