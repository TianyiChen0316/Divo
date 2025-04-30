--stack_templates_generated-c98b2503-c1bb-4700-983e-62dd3c2ce853_bf856de4-707b-3db5-ae68-9ba5e2e38acd.sql
--{"gen": "erase", "time": 3.191257953643799, "template": "generated-c98b2503-c1bb-4700-983e-62dd3c2ce853", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM site AS site,
tag_question AS tag_question,
post_link AS pl,
question AS q1,
tag_question AS tq1,
tag_question AS tq2
WHERE (site.site_name = 'es' AND tag_question.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.tag_id = tq1.tag_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND pl.post_id_to = tq2.question_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq2.site_id = tag_question.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND tq2.site_id = site.site_id AND q1.site_id = site.site_id AND site.site_id = pl.site_id AND site.site_id = tq1.site_id)
