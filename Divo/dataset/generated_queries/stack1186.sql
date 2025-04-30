--stack_templates_3da79ca73e4d31382078b8aaf0be182d650192d1_37d8232b-404c-3d86-84dd-5fc51275aea9.sql
--{"gen": "combine", "time": 0.1264362335205078, "template": "3da79ca73e4d31382078b8aaf0be182d650192d1", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
badge AS b1,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b2,
so_user AS so_user
WHERE (acc.website_url ILIKE '%code%' AND q1.favorite_count <= 10000 AND q1.favorite_count <= 10 AND s.site_name = 'esperanto' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b2.name = 'Publicist' AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = so_user.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND s.site_id = so_user.site_id AND s.site_id = b2.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = so_user.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND q1.site_id = b2.site_id AND q1.site_id = tq1.site_id AND so_user.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND b2.date > b1.date + '11 months'::interval)
