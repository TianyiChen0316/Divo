--stack_templates_q1-097_4112d697-6f28-3558-b3c0-b38241ec63ff.sql
--{"gen": "combine", "time": 0.14691829681396484, "template": "q1-097", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM site AS site,
tag_question AS tag_question,
comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
tag_question AS tq1,
tag_question AS tq2
WHERE (site.site_name = 'buddhism' AND tag_question.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.tag_id = tq1.tag_id AND c1.site_id = pl.site_id AND c1.site_id = c2.site_id AND c1.site_id = tq2.site_id AND c1.site_id = tq1.site_id AND pl.site_id = c2.site_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND c2.site_id = tq2.site_id AND c2.site_id = q1.site_id AND c2.site_id = tq1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND c1.post_id = tq1.question_id AND c1.post_id = pl.post_id_from AND tq1.question_id = pl.post_id_from AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = site.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = site.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND tag_question.site_id = c1.site_id AND q1.site_id = site.site_id AND site.site_id = pl.site_id AND site.site_id = tq1.site_id AND site.site_id = c1.site_id AND c1.date < c2.date)
