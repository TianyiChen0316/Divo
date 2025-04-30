--stack_templates_generated-ce529943-e3b3-4a77-87d5-648b799e4827_c8f3ffdf-dcf6-356f-b461-495a456074db.sql
--{"gen": "erase", "time": 1.697983741760254, "template": "generated-ce529943-e3b3-4a77-87d5-648b799e4827", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS question,
tag AS tag,
tag_question AS tag_question,
post_link AS pl,
question AS q1,
tag_question AS tq1,
tag_question AS tq2,
so_user AS u1
WHERE (tag.name = 'msbuild' AND u1.downvotes >= 0 AND u1.downvotes >= 10 AND tag_question.question_id = question.id AND tag_question.tag_id = tag.id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = pl.post_id_from AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND pl.site_id = tq1.site_id AND pl.post_id_to = tq2.question_id AND tq2.site_id = question.site_id AND tq2.site_id = tag.site_id AND question.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = tag.site_id AND question.site_id = pl.site_id AND question.site_id = tq1.site_id AND tag_question.site_id = tag.site_id AND q1.site_id = tag.site_id AND tag.site_id = pl.site_id AND tag.site_id = tq1.site_id AND tq1.tag_id = tag.id AND tq2.tag_id = tag.id AND q1.owner_user_id = u1.id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND tq2.site_id = u1.site_id AND question.site_id = u1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = tag.site_id AND u1.site_id = pl.site_id)
