--stack_templates_3da79ca73e4d31382078b8aaf0be182d650192d1_fb360714-2748-3021-a826-c1cbf3240bd2.sql
--{"gen": "erase", "time": 0.25603556632995605, "template": "3da79ca73e4d31382078b8aaf0be182d650192d1", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (q1.favorite_count <= 1 AND q1.favorite_count >= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND acc.website_url ILIKE '%code%' AND t1.id = tq1.tag_id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.owner_user_id = b1.user_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = b1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = b1.site_id AND tq1.site_id = b1.site_id)
