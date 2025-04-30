--stack_templates_3da79ca73e4d31382078b8aaf0be182d650192d1_8dd32daf-6840-30d5-8bf2-4c66feea4a39.sql
--{"gen": "combine", "time": 1.5459766387939453, "template": "3da79ca73e4d31382078b8aaf0be182d650192d1", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
comment AS c1,
comment AS c2,
post_link AS pl,
site AS site,
tag_question AS tq2
WHERE (acc.website_url ILIKE '%com' AND q1.favorite_count <= 10000 AND q1.favorite_count <= 1 AND s.site_name = 'pm' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND site.site_name = 'raspberrypi' AND acc.id = u1.account_id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND pl.site_id = site.site_id AND tq1.tag_id = tq2.tag_id AND tq2.tag_id = t1.id AND tq1.question_id = c1.post_id AND tq1.question_id = pl.post_id_from AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = t1.site_id AND tq2.site_id = s.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = t1.site_id AND c2.site_id = s.site_id AND c2.site_id = u1.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = site.site_id AND t1.site_id = pl.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND s.site_id = site.site_id AND s.site_id = pl.site_id AND s.site_id = c1.site_id AND u1.site_id = q1.site_id AND u1.site_id = site.site_id AND u1.site_id = pl.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = site.site_id AND q1.site_id = tq1.site_id AND site.site_id = tq1.site_id AND site.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND c1.date < c2.date)
