--stack_templates_generated-b8db5b6e-49f5-4d18-9fd1-95e7f5b2bc82_b12d3455-9816-39ae-a0d6-e24b63c7ed6b.sql
--{"gen": "combine", "time": 4.169466257095337, "template": "generated-b8db5b6e-49f5-4d18-9fd1-95e7f5b2bc82", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM post_link AS pl,
question AS q1,
tag_question AS tq1,
tag_question AS tq2,
question AS question,
tag_question AS tag_question,
account AS account,
site AS s1,
so_user AS u1,
so_user AS u2,
tag AS t2,
badge AS b1,
so_user AS so_user
WHERE (s1.site_name = 'photo' AND t2.name = 'steins-gate' AND b1.name = 'Nice Question' AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tag_question.question_id = question.id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = pl.post_id_from AND tq2.site_id = question.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND question.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = pl.site_id AND question.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND pl.site_id = tq1.site_id AND pl.post_id_to = tq2.question_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND account.id = u2.account_id AND account.id = so_user.account_id AND u2.account_id = so_user.account_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND tq2.site_id = t2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = u2.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND question.site_id = t2.site_id AND question.site_id = u1.site_id AND question.site_id = u2.site_id AND question.site_id = s1.site_id AND t2.site_id = u1.site_id AND t2.site_id = tag_question.site_id AND t2.site_id = q1.site_id AND t2.site_id = pl.site_id AND t2.site_id = s1.site_id AND t2.site_id = tq1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = u2.site_id AND u1.site_id = pl.site_id AND tag_question.site_id = u2.site_id AND tag_question.site_id = s1.site_id AND q1.site_id = u2.site_id AND u2.site_id = pl.site_id AND u2.site_id = s1.site_id AND u2.site_id = tq1.site_id AND pl.site_id = s1.site_id AND tag_question.tag_id = t2.id AND t2.id = tq1.tag_id)
