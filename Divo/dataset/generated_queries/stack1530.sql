--stack_templates_generated-c98b2503-c1bb-4700-983e-62dd3c2ce853_b65c54a4-1de0-3648-991c-d47220d73146.sql
--{"gen": "combine", "time": 4.116822957992554, "template": "generated-c98b2503-c1bb-4700-983e-62dd3c2ce853", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS question,
site AS site,
tag_question AS tag_question,
post_link AS pl,
question AS q1,
question AS q2,
tag_question AS tq1,
tag_question AS tq2,
comment AS c1,
comment AS c2,
tag AS tag
WHERE (site.site_name = 'hsm' AND tag.name IN ('wpf', '.net', 'json') AND question.site_id = site.site_id AND tag_question.question_id = question.id AND tag_question.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.site_id = q2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = tq1.tag_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND q2.site_id = q1.site_id AND q2.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND pl.post_id_to = tq2.question_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq2.site_id = question.site_id AND tq2.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = pl.site_id AND question.site_id = q2.site_id AND question.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = q2.site_id AND tag_question.site_id = tq1.site_id AND tq2.site_id = site.site_id AND question.site_id = tag_question.site_id AND q1.site_id = site.site_id AND site.site_id = pl.site_id AND site.site_id = q2.site_id AND site.site_id = tq1.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND c2.post_id = q2.id AND c2.site_id = q2.site_id AND tag.id = tq1.tag_id AND tag.id = tq2.tag_id AND tag.site_id = pl.site_id AND tag.site_id = tq1.site_id AND tag.site_id = tq1.site_id AND tag.id = tag_question.tag_id AND tq2.site_id = c2.site_id AND tq2.site_id = tag.site_id AND tq2.site_id = c1.site_id AND c2.site_id = question.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = tag.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND question.site_id = tag.site_id AND question.site_id = c1.site_id AND tag_question.site_id = tag.site_id AND tag_question.site_id = c1.site_id AND q1.site_id = tag.site_id AND site.site_id = tag.site_id AND site.site_id = c1.site_id AND tag.site_id = q2.site_id AND tag.site_id = c1.site_id AND pl.site_id = c1.site_id AND q2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND c1.post_id = pl.post_id_from AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND c1.date < c2.date)
