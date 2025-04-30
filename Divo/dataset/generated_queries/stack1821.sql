--stack_templates_generated-5b3e0dd9-7eff-4d93-b819-0320e9da2129_3f10dcfb-2623-32bf-8276-5d10cfe9bdac.sql
--{"gen": "combine", "time": 0.9193298816680908, "template": "generated-5b3e0dd9-7eff-4d93-b819-0320e9da2129", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM site AS site,
tag_question AS tag_question,
post_link AS pl,
question AS q1,
tag_question AS tq1,
tag_question AS tq2,
badge AS b1,
site AS s,
so_user AS u1,
tag AS t1
WHERE (site.site_name = 'beer' AND s.site_name = 'ethereum' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND tag_question.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.tag_id = tq1.tag_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND pl.post_id_to = tq2.question_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq2.site_id = tag_question.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND tq2.site_id = site.site_id AND q1.site_id = site.site_id AND site.site_id = pl.site_id AND site.site_id = tq1.site_id AND b1.user_id = u1.id AND q1.owner_user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND tq2.site_id = t1.site_id AND tq2.site_id = s.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = b1.site_id AND t1.site_id = u1.site_id AND t1.site_id = tag_question.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = site.site_id AND t1.site_id = pl.site_id AND t1.site_id = tq1.site_id AND s.site_id = tag_question.site_id AND s.site_id = site.site_id AND s.site_id = pl.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = site.site_id AND u1.site_id = pl.site_id AND u1.site_id = tq1.site_id AND tag_question.site_id = b1.site_id AND b1.site_id = q1.site_id AND b1.site_id = site.site_id AND b1.site_id = pl.site_id AND b1.site_id = tq1.site_id AND tq2.tag_id = t1.id AND tag_question.tag_id = t1.id AND b1.user_id = q1.owner_user_id)
