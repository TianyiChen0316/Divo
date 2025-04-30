--stack_templates_3da79ca73e4d31382078b8aaf0be182d650192d1_f94373c8-4d44-3a12-8829-b4a2983e3d9c.sql
--{"gen": "combine", "time": 0.15217137336730957, "template": "3da79ca73e4d31382078b8aaf0be182d650192d1", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
badge AS b1,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
so_user AS u2,
tag AS t2,
tag_question AS tq2
WHERE (acc.website_url ILIKE '%in' AND q1.favorite_count <= 10 AND q1.favorite_count >= 1 AND s.site_name = 'academia' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND t2.name = 'drop-down-menu' AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u2.account_id = account.id AND tq2.site_id = t2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = u2.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = acc.id AND acc.id = u2.account_id AND b1.user_id = q1.owner_user_id)
