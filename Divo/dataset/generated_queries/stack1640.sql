--stack_templates_q8-030_29be407f-2b70-3e54-92a1-e40f8176386b.sql
--{"gen": "erase", "time": 0.8851559162139893, "template": "q8-030", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c2,
post_link AS pl,
question AS q1,
question AS q2,
tag AS tag,
tag_question AS tq1,
tag_question AS tq2
WHERE (tag.name IN ('wpf', '.net', 'json') AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND c2.site_id = q2.site_id AND c2.post_id = q2.id AND tag.id = tq1.tag_id AND tag.site_id = tq1.site_id AND tag.id = tq2.tag_id AND tag.site_id = tq1.site_id AND tag.site_id = pl.site_id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.site_id = q2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = tq1.tag_id AND pl.site_id = c2.site_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND c2.site_id = tq2.site_id AND c2.site_id = tag.site_id AND c2.site_id = q1.site_id AND c2.site_id = tq1.site_id AND tq2.site_id = tag.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND tag.site_id = q2.site_id AND tag.site_id = q1.site_id AND q2.site_id = q1.site_id AND q2.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id)
