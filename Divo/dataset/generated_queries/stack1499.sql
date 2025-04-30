--stack_templates_generated-76687f57-1168-47b9-b53e-bb0b4fa3e98a_73fd882b-a5c7-35b5-b427-d4f02289d882.sql
--{"gen": "erase", "time": 4.92225193977356, "template": "generated-76687f57-1168-47b9-b53e-bb0b4fa3e98a", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c2,
post_link AS pl,
question AS q1,
question AS q2,
tag_question AS tq1,
tag_question AS tq2,
question AS question,
tag_question AS tag_question,
site AS s1,
so_user AS u1,
answer AS a1
WHERE (s1.site_name = 'computergraphics' AND c2.post_id = q2.id AND c2.site_id = q2.site_id AND pl.post_id_from = q1.id AND pl.post_id_to = q2.id AND pl.site_id = q1.site_id AND pl.site_id = q2.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq2.question_id = q2.id AND tq2.site_id = q2.site_id AND tag_question.question_id = question.id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = question.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND c2.site_id = question.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND question.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = pl.site_id AND question.site_id = q2.site_id AND question.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = q2.site_id AND tag_question.site_id = tq1.site_id AND q1.site_id = q2.site_id AND pl.site_id = tq1.site_id AND q2.site_id = tq1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.question_id = tq1.question_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.owner_user_id = a1.owner_user_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND tq2.site_id = a1.site_id AND c2.site_id = u1.site_id AND c2.site_id = s1.site_id AND c2.site_id = a1.site_id AND question.site_id = u1.site_id AND question.site_id = s1.site_id AND question.site_id = a1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = pl.site_id AND u1.site_id = q2.site_id AND tag_question.site_id = s1.site_id AND tag_question.site_id = a1.site_id AND pl.site_id = s1.site_id AND pl.site_id = a1.site_id AND q2.site_id = s1.site_id AND q2.site_id = a1.site_id AND a1.question_id = pl.post_id_from)
