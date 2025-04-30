--stack_templates_3da79ca73e4d31382078b8aaf0be182d650192d1_fd37cf2a-24ac-3694-aa7b-65d4100f0d4f.sql
--{"gen": "erase", "time": 0.26204419136047363, "template": "3da79ca73e4d31382078b8aaf0be182d650192d1", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (q1.favorite_count <= 10000 AND q1.favorite_count <= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND acc.website_url ILIKE '%me' AND t1.id = tq1.tag_id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND acc.id = u1.account_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
