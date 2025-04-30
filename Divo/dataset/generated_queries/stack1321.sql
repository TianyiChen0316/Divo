--stack_templates_generated-ecf4055c-07e1-4d48-b10b-3ad30dcbe6d2_a1e8dc32-ac2e-3a84-a7d3-afa758316926.sql
--{"gen": "combine", "time": 0.3585841655731201, "template": "generated-ecf4055c-07e1-4d48-b10b-3ad30dcbe6d2", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
question AS q2,
site AS site,
tag_question AS tq1,
tag_question AS tq2,
tag AS tag
WHERE (site.site_name = 'spanish' AND tag.name IN ('wpf', '.net', 'json') AND pl.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c2.site_id = q2.site_id AND c2.post_id = q2.id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.site_id = q2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = tq1.tag_id AND c1.site_id = pl.site_id AND c1.site_id = c2.site_id AND c1.site_id = tq2.site_id AND c1.site_id = q2.site_id AND c1.site_id = tq1.site_id AND c1.site_id = site.site_id AND pl.site_id = c2.site_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND c2.site_id = tq2.site_id AND c2.site_id = q1.site_id AND c2.site_id = tq1.site_id AND c2.site_id = site.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = site.site_id AND q2.site_id = q1.site_id AND q2.site_id = tq1.site_id AND q2.site_id = site.site_id AND q1.site_id = site.site_id AND tq1.site_id = site.site_id AND c1.post_id = tq1.question_id AND c1.post_id = pl.post_id_from AND tq1.question_id = pl.post_id_from AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND tag.id = tq1.tag_id AND tag.id = tq2.tag_id AND tag.site_id = pl.site_id AND tag.site_id = tq1.site_id AND tag.site_id = tq1.site_id AND tq2.site_id = tag.site_id AND c2.site_id = tag.site_id AND q1.site_id = tag.site_id AND site.site_id = tag.site_id AND tag.site_id = q2.site_id AND tag.site_id = c1.site_id AND c1.date < c2.date)
