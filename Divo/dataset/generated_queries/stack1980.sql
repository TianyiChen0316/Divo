--stack_templates_generated-5b3e0dd9-7eff-4d93-b819-0320e9da2129_fa583986-8ec4-35aa-8074-6c21d2d7fb0c.sql
--{"gen": "combine", "time": 0.120361328125, "template": "generated-5b3e0dd9-7eff-4d93-b819-0320e9da2129", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM site AS site,
tag_question AS tag_question,
post_link AS pl,
question AS q1,
tag_question AS tq1,
tag_question AS tq2,
question AS q2,
tag AS tag
WHERE (site.site_name = 'gis' AND tag.name IN ('wpf', '.net', 'json') AND tag_question.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.tag_id = tq1.tag_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND pl.post_id_to = tq2.question_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq2.site_id = tag_question.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND tq2.site_id = site.site_id AND q1.site_id = site.site_id AND site.site_id = pl.site_id AND site.site_id = tq1.site_id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND tag.id = tq1.tag_id AND tag.site_id = tq1.site_id AND tag.id = tq2.tag_id AND tag.site_id = tq1.site_id AND tag.site_id = pl.site_id AND tq2.site_id = q2.site_id AND tq2.question_id = q2.id AND tq2.site_id = tag.site_id AND tag.site_id = q2.site_id AND tag.site_id = q1.site_id AND q2.site_id = q1.site_id AND q2.site_id = tq1.site_id AND tag.id = tag_question.tag_id AND tag_question.site_id = tag.site_id AND tag_question.site_id = q2.site_id AND site.site_id = tag.site_id AND site.site_id = q2.site_id)
