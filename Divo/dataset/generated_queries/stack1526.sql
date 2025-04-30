--stack_templates_q4-075_6fd13e53-8de6-3e34-b300-8e8b9a740cf3.sql
--{"gen": "combine", "time": 2.5428943634033203, "template": "q4-075", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
question AS question,
tag AS tag,
tag_question AS tag_question,
comment AS c2,
post_link AS pl,
tag_question AS tq2
WHERE (s1.site_name = 'lifehacks' AND tag.name = 'int' AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tag_question.question_id = question.id AND tag_question.tag_id = tag.id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND pl.site_id = tq1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND tq2.site_id = question.site_id AND tq2.site_id = tag.site_id AND c2.site_id = question.site_id AND c2.site_id = tag.site_id AND question.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = tag.site_id AND question.site_id = pl.site_id AND question.site_id = tq1.site_id AND tag_question.site_id = tag.site_id AND q1.site_id = tag.site_id AND tag.site_id = pl.site_id AND tag.site_id = tq1.site_id AND tq1.tag_id = tag.id AND tq2.tag_id = tag.id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND c2.site_id = u1.site_id AND c2.site_id = s1.site_id AND question.site_id = u1.site_id AND question.site_id = s1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = q1.site_id AND u1.site_id = pl.site_id AND u1.site_id = s1.site_id AND u1.site_id = tag.site_id AND u1.site_id = tq1.site_id AND tag_question.site_id = s1.site_id AND q1.site_id = tq1.site_id AND pl.site_id = s1.site_id AND s1.site_id = tag.site_id)
