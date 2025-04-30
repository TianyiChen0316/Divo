--stack_templates_generated-583a4ff9-83da-456f-aa29-7ee5ef86b198_364f627d-b851-3de5-abfa-edeadf6a315c.sql
--{"gen": "combine", "time": 0.2305283546447754, "template": "generated-583a4ff9-83da-456f-aa29-7ee5ef86b198", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
site AS site,
tag_question AS tq2,
question AS question,
tag AS tag,
tag_question AS tag_question
WHERE (site.site_name = 'computergraphics' AND tag.name = 'offline-caching' AND pl.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c1.site_id = pl.site_id AND c1.site_id = c2.site_id AND c1.site_id = tq2.site_id AND c1.site_id = site.site_id AND pl.site_id = c2.site_id AND pl.site_id = tq2.site_id AND c2.site_id = tq2.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND q1.site_id = site.site_id AND c1.post_id = pl.post_id_from AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND question.site_id = site.site_id AND tag.site_id = site.site_id AND tag_question.question_id = question.id AND tag_question.site_id = site.site_id AND tag_question.tag_id = tag.id AND tq2.site_id = question.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = tag.site_id AND c2.site_id = question.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = tag.site_id AND question.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = tag.site_id AND question.site_id = pl.site_id AND question.site_id = c1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = tag.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = c1.site_id AND q1.site_id = tag.site_id AND tag.site_id = pl.site_id AND tag.site_id = c1.site_id AND c1.date < c2.date)
