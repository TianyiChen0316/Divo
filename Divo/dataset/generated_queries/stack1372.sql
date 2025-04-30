--stack_templates_3da79ca73e4d31382078b8aaf0be182d650192d1_da8bdb0a-dd15-3964-a74c-105d4a63920a.sql
--{"gen": "combine", "time": 4.623225450515747, "template": "3da79ca73e4d31382078b8aaf0be182d650192d1", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
badge AS b1,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1
WHERE (acc.website_url ILIKE '%io' AND q1.favorite_count <= 10000 AND q1.favorite_count >= 0 AND s.site_name = 'stackoverflow' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND s.site_id = a1.site_id AND tq1.question_id = a1.question_id AND a1.owner_user_id = b1.user_id AND a1.owner_user_id = q1.owner_user_id AND b1.user_id = q1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = a1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = tq1.site_id)
