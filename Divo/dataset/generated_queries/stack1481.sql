--stack_templates_generated-69b4b21b-0e1e-43cf-992a-3c3bf04cb816_2140b1b7-bc5c-3fa9-8311-96bcb4cc4bdd.sql
--{"gen": "combine", "time": 0.24856829643249512, "template": "generated-69b4b21b-0e1e-43cf-992a-3c3bf04cb816", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM post_link AS pl,
question AS q1,
tag_question AS tq1,
tag_question AS tq2,
tag_question AS tag_question,
account AS account,
answer AS a1,
site AS s1,
so_user AS u1,
question AS q2,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'wordpress' AND t2.name = 'jsf' AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = pl.post_id_from AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND pl.site_id = tq1.site_id AND pl.post_id_to = tq2.question_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = a1.site_id AND tq2.site_id = s1.site_id AND t2.site_id = u1.site_id AND t2.site_id = tag_question.site_id AND t2.site_id = q1.site_id AND t2.site_id = a1.site_id AND t2.site_id = pl.site_id AND t2.site_id = s1.site_id AND t2.site_id = tq1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = u2.site_id AND u1.site_id = pl.site_id AND u1.site_id = q2.site_id AND tag_question.site_id = u2.site_id AND tag_question.site_id = a1.site_id AND tag_question.site_id = s1.site_id AND tag_question.site_id = q2.site_id AND q1.site_id = u2.site_id AND q1.site_id = q2.site_id AND u2.site_id = a1.site_id AND u2.site_id = pl.site_id AND u2.site_id = s1.site_id AND u2.site_id = tq1.site_id AND a1.site_id = pl.site_id AND a1.site_id = q2.site_id AND pl.site_id = s1.site_id AND pl.site_id = q2.site_id AND s1.site_id = q2.site_id AND q2.site_id = tq1.site_id AND a1.question_id = pl.post_id_from AND tag_question.tag_id = t2.id AND t2.id = tq1.tag_id AND pl.post_id_to = q2.id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
