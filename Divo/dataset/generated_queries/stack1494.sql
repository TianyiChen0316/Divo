--stack_templates_q8-030_2c6f996b-bf25-3521-881c-8fc52f217428.sql
--{"gen": "combine", "time": 4.537726879119873, "template": "q8-030", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
question AS q2,
site AS site,
tag AS tag,
tag_question AS tq1,
tag_question AS tq2,
question AS question,
tag_question AS tag_question
WHERE (site.site_name = 'gis' AND tag.name IN ('wpf', '.net', 'json') AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND c2.post_id = q2.id AND c2.site_id = q2.site_id AND pl.post_id_from = q1.id AND pl.post_id_to = q2.id AND pl.site_id = q1.site_id AND pl.site_id = q2.site_id AND pl.site_id = site.site_id AND tag.id = tq1.tag_id AND tag.id = tq2.tag_id AND tag.site_id = pl.site_id AND tag.site_id = tq1.site_id AND tag.site_id = tq1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq2.question_id = q2.id AND tq2.site_id = q2.site_id AND question.site_id = site.site_id AND tag_question.question_id = question.id AND tag_question.site_id = site.site_id AND tag_question.tag_id = tag.id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = c1.post_id AND tq1.question_id = pl.post_id_from AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = question.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = tag.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = question.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = tag.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND question.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = tag.site_id AND question.site_id = pl.site_id AND question.site_id = q2.site_id AND question.site_id = tq1.site_id AND question.site_id = c1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = tag.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = q2.site_id AND tag_question.site_id = tq1.site_id AND tag_question.site_id = c1.site_id AND q1.site_id = site.site_id AND q1.site_id = tag.site_id AND q1.site_id = q2.site_id AND site.site_id = tag.site_id AND site.site_id = q2.site_id AND site.site_id = tq1.site_id AND site.site_id = c1.site_id AND tag.site_id = q2.site_id AND tag.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND q2.site_id = tq1.site_id AND q2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND c1.date < c2.date)
