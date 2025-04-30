--stack_templates_generated-c5ec670e-f9c4-4e02-bf69-a76a840fead7_c1cb62f0-6d8a-3227-b299-be65957ee9a5.sql
--{"gen": "combine", "time": 3.1814491748809814, "template": "generated-c5ec670e-f9c4-4e02-bf69-a76a840fead7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS question,
tag AS tag,
tag_question AS tag_question,
post_link AS pl,
question AS q1,
tag_question AS tq1,
tag_question AS tq2,
so_user AS u1,
question AS q2
WHERE (tag.name = 'clojure' AND u1.downvotes <= 1 AND u1.downvotes <= 100000 AND tag_question.question_id = question.id AND tag_question.tag_id = tag.id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = pl.post_id_from AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND pl.site_id = tq1.site_id AND pl.post_id_to = tq2.question_id AND tq2.site_id = question.site_id AND tq2.site_id = tag.site_id AND question.site_id = q1.site_id AND question.site_id = pl.site_id AND question.site_id = tq1.site_id AND q1.site_id = tag.site_id AND tag.site_id = pl.site_id AND tag.site_id = tq1.site_id AND tq1.tag_id = tag.id AND tq2.tag_id = tag.id AND q1.owner_user_id = u1.id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND tq2.site_id = u1.site_id AND question.site_id = u1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = tag.site_id AND u1.site_id = pl.site_id AND question.site_id = tag_question.site_id AND question.site_id = tag.site_id AND tag_question.site_id = tag.site_id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND tq2.site_id = q2.site_id AND tq2.question_id = q2.id AND tag.site_id = q2.site_id AND q2.site_id = q1.site_id AND q2.site_id = tq1.site_id AND question.site_id = q2.site_id AND tag_question.site_id = q2.site_id AND u1.site_id = q2.site_id)
