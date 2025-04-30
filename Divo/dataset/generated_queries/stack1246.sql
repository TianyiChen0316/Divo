--stack_templates_q1-097_43794920-a13a-3716-80a9-9968d934b4ba.sql
--{"gen": "combine", "time": 2.5019006729125977, "template": "q1-097", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS question,
site AS site,
tag_question AS tag_question,
post_link AS pl,
question AS q1,
question AS q2,
tag_question AS tq1,
tag_question AS tq2
WHERE (site.site_name = 'raspberrypi' AND question.site_id = site.site_id AND tag_question.question_id = question.id AND tag_question.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.site_id = q2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = tq1.tag_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND q2.site_id = q1.site_id AND q2.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND pl.post_id_to = tq2.question_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq2.site_id = question.site_id AND tq2.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = pl.site_id AND question.site_id = q2.site_id AND question.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = q2.site_id AND tag_question.site_id = tq1.site_id AND tq2.site_id = site.site_id AND question.site_id = tag_question.site_id AND q1.site_id = site.site_id AND site.site_id = pl.site_id AND site.site_id = q2.site_id AND site.site_id = tq1.site_id)
