--stack_templates_generated-3c3fef37-13bc-4cce-844c-f112fd29e120_a90cbb82-d3e8-3b86-b3da-853316d175e7.sql
--{"gen": "combine", "time": 1.016909122467041, "template": "generated-3c3fef37-13bc-4cce-844c-f112fd29e120", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
badge AS b1,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b2,
so_user AS so_user,
comment AS c1,
site AS s1
WHERE (acc.website_url ILIKE '%' AND q1.favorite_count <= 1 AND q1.favorite_count <= 10 AND s.site_name = 'physics' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b2.name = 'Commentator' AND s1.site_name = 'electronics' AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = so_user.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND s.site_id = so_user.site_id AND s.site_id = b2.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = so_user.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND q1.site_id = b2.site_id AND q1.site_id = tq1.site_id AND so_user.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c1.post_id = tq1.question_id AND c1.site_id = u1.site_id AND c1.site_id = s1.site_id AND c1.site_id = tq1.site_id AND u1.site_id = s1.site_id AND t1.site_id = s1.site_id AND t1.site_id = c1.site_id AND s.site_id = s1.site_id AND s.site_id = c1.site_id AND b1.site_id = s1.site_id AND b1.site_id = c1.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = c1.site_id AND b2.site_id = s1.site_id AND b2.site_id = c1.site_id AND b2.date > b1.date + '11 months'::interval AND c1.score > q1.score)
