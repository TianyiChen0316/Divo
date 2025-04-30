--stack_templates_generated-bf8e7162-e09e-4778-9d4c-7adbf9d2d50e_d618f2ae-9b4d-35ca-9959-1b991fc369b8.sql
--{"gen": "combine", "time": 0.22158432006835938, "template": "generated-bf8e7162-e09e-4778-9d4c-7adbf9d2d50e", "dataset": "stack_templates", "rows": 1}
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
site AS s1,
site AS s2,
so_user AS u2,
tag AS t2,
tag_question AS tq2
WHERE (acc.website_url ILIKE '%in' AND q1.favorite_count <= 5000 AND q1.favorite_count <= 10000 AND s.site_name = 'stats' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b2.name = 'Research Assistant' AND s1.site_name = 'outdoors' AND s2.site_name = 'datascience' AND t2.name = 'containstable' AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND t1.site_id = b2.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = b2.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND q1.owner_user_id = b1.user_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND s.site_id = so_user.site_id AND s.site_id = b2.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND t2.site_id = s2.site_id AND tq1.site_id = s1.site_id AND tq2.site_id = s2.site_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND acc.id = u2.account_id AND s.site_id = s1.site_id AND u1.site_id = s1.site_id AND b1.site_id = s1.site_id AND so_user.site_id = s1.site_id AND b2.site_id = s1.site_id AND tq2.site_id = t2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = u2.site_id AND s2.site_id = u2.site_id AND b2.date > b1.date + '11 months'::interval)
