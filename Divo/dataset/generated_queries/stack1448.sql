--stack_templates_generated-7771adb5-6f99-4028-afea-453dd04d02cb_953af4d7-960d-356c-b944-70120303e288.sql
--{"gen": "combine", "time": 1.5606365203857422, "template": "generated-7771adb5-6f99-4028-afea-453dd04d02cb", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS question,
tag AS tag,
tag_question AS tag_question,
post_link AS pl,
question AS q1,
question AS q2,
tag_question AS tq1,
tag_question AS tq2,
account AS account,
site AS s1,
so_user AS u1
WHERE (tag.name = 'limits' AND s1.site_name = 'bitcoin' AND tag_question.question_id = question.id AND tag_question.tag_id = tag.id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND tag.id = tq1.tag_id AND tag.site_id = tq1.site_id AND tag.id = tq2.tag_id AND tag.site_id = tq1.site_id AND tag.site_id = pl.site_id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.site_id = q2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = tq1.tag_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND tq2.site_id = tag.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND tag.site_id = q2.site_id AND tag.site_id = q1.site_id AND q2.site_id = q1.site_id AND q2.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND pl.post_id_to = tq2.question_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq2.site_id = question.site_id AND tq2.site_id = tag_question.site_id AND question.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = tag.site_id AND question.site_id = pl.site_id AND question.site_id = q2.site_id AND question.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = tag.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = q2.site_id AND tag_question.site_id = tq1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND question.site_id = u1.site_id AND question.site_id = s1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = tag.site_id AND u1.site_id = pl.site_id AND u1.site_id = q2.site_id AND tag_question.site_id = s1.site_id AND tag.site_id = s1.site_id AND pl.site_id = s1.site_id AND q2.site_id = s1.site_id)
