--stack_templates_generated-2e2b57ee-6db0-468f-a2fb-84ad3fa3a9fb_f981a5e7-5a89-33c4-a86c-870df1b76367.sql
--{"gen": "combine", "time": 0.5251762866973877, "template": "generated-2e2b57ee-6db0-468f-a2fb-84ad3fa3a9fb", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
tag_question AS tq2,
tag_question AS tag_question,
account AS account,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
question AS q,
tag_question AS tq,
tag AS t
WHERE (s1.site_name = 'buddhism' AND t1.name IN ('copyright', 'sunyata') AND q.score > 5 AND q.score > 5 AND t.name IN ('tables', 'tikz-pgf') AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tq2.tag_id = tag_question.tag_id AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = c1.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = pl.site_id AND c2.site_id = c1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = c1.site_id AND pl.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND tq2.site_id = t1.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND tq2.site_id = tq1.site_id AND c2.site_id = t1.site_id AND c2.site_id = u1.site_id AND c2.site_id = s1.site_id AND c2.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = tag_question.site_id AND t1.site_id = q1.site_id AND t1.site_id = pl.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = pl.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND tag_question.site_id = s1.site_id AND tag_question.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND pl.site_id = s1.site_id AND pl.site_id = tq1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND tq1.question_id = pl.post_id_from AND tq.question_id = q.id AND tq.site_id = q.site_id AND tq.tag_id = t.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = t.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = q.site_id AND q1.site_id = q.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND tq2.site_id = tq.site_id AND tq2.site_id = t.site_id AND tq2.site_id = q.site_id AND c2.site_id = tq.site_id AND c2.site_id = t.site_id AND c2.site_id = q.site_id AND tq.site_id = tag_question.site_id AND tq.site_id = pl.site_id AND tq.site_id = s1.site_id AND tq.site_id = c1.site_id AND tag_question.site_id = t.site_id AND tag_question.site_id = q.site_id AND t.site_id = pl.site_id AND t.site_id = s1.site_id AND t.site_id = c1.site_id AND pl.site_id = q.site_id AND s1.site_id = q.site_id AND q.site_id = c1.site_id AND c1.date < c2.date)
