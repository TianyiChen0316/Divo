--stack_templates_3da79ca73e4d31382078b8aaf0be182d650192d1_b16302f6-9f66-3dd8-8f52-6952ca9703d3.sql
--{"gen": "combine", "time": 0.1417849063873291, "template": "3da79ca73e4d31382078b8aaf0be182d650192d1", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
badge AS b1,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
badge AS b
WHERE (acc.website_url ILIKE '%me' AND q1.favorite_count <= 10000 AND q1.favorite_count <= 1 AND s.site_name = 'ethereum' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND q1.id = a1.question_id AND s.site_id = a1.site_id AND s.site_id = b.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = b1.user_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = b1.user_id AND b.user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = a1.site_id AND b1.site_id = b.site_id AND b1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND b.site_id = tq1.site_id)
