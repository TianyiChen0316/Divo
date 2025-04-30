--stack_templates_q8-030_f94373c8-4d44-3a12-8829-b4a2983e3d9c.sql
--{"gen": "combine", "time": 2.6850781440734863, "template": "q8-030", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
question AS q2,
site AS site,
tag AS tag,
tag_question AS tq1,
tag_question AS tq2
WHERE (site.site_name = 'stackoverflow' AND tag.name IN ('wpf', '.net', 'json') AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND c2.post_id = q2.id AND c2.site_id = q2.site_id AND pl.post_id_from = q1.id AND pl.post_id_to = q2.id AND pl.site_id = q1.site_id AND pl.site_id = q2.site_id AND pl.site_id = site.site_id AND tag.id = tq1.tag_id AND tag.id = tq2.tag_id AND tag.site_id = pl.site_id AND tag.site_id = tq1.site_id AND tag.site_id = tq1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq2.question_id = q2.id AND tq2.site_id = q2.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND tq1.tag_id = tq2.tag_id AND tq1.question_id = c1.post_id AND tq1.question_id = pl.post_id_from AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = tag.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = tag.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND q1.site_id = site.site_id AND q1.site_id = tag.site_id AND q1.site_id = q2.site_id AND site.site_id = tag.site_id AND site.site_id = q2.site_id AND site.site_id = tq1.site_id AND site.site_id = c1.site_id AND tag.site_id = q2.site_id AND tag.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND q2.site_id = tq1.site_id AND q2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c1.date < c2.date)
