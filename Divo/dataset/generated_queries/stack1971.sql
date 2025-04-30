--stack_templates_generated-827b5fcc-b0a6-4bcf-ab71-afe7358442ac_07efe9f3-7c29-3448-8c62-358ea7c8ded2.sql
--{"gen": "erase", "time": 0.8926608562469482, "template": "generated-827b5fcc-b0a6-4bcf-ab71-afe7358442ac", "dataset": "stack_templates", "rows": 1}
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
so_user AS so_user
WHERE (s1.site_name = 'drupal' AND t2.name = 'sight-reading' AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tag_question.question_id = question.id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = pl.post_id_from AND tq2.site_id = question.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND question.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = pl.site_id AND question.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND pl.site_id = tq1.site_id AND pl.post_id_to = tq2.question_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND so_user.account_id = u1.account_id AND account.id = u2.account_id AND account.id = so_user.account_id AND u2.account_id = so_user.account_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND tq2.site_id = t2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = u2.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND question.site_id = t2.site_id AND question.site_id = u1.site_id AND question.site_id = u2.site_id AND question.site_id = s1.site_id AND t2.site_id = u1.site_id AND t2.site_id = tag_question.site_id AND t2.site_id = q1.site_id AND t2.site_id = pl.site_id AND t2.site_id = s1.site_id AND t2.site_id = tq1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = u2.site_id AND u1.site_id = pl.site_id AND tag_question.site_id = u2.site_id AND tag_question.site_id = s1.site_id AND q1.site_id = u2.site_id AND u2.site_id = pl.site_id AND u2.site_id = s1.site_id AND u2.site_id = tq1.site_id AND pl.site_id = s1.site_id AND tag_question.tag_id = t2.id AND t2.id = tq1.tag_id)
