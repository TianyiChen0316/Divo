--stack_templates_generated-ecf4055c-07e1-4d48-b10b-3ad30dcbe6d2_8fd0db30-6d4f-3852-91be-f1b5c4ae17b4.sql
--{"gen": "combine", "time": 1.5409321784973145, "template": "generated-ecf4055c-07e1-4d48-b10b-3ad30dcbe6d2", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
question AS q2,
tag_question AS tq1,
tag_question AS tq2,
account AS account,
answer AS a1,
site AS s1,
so_user AS u1,
so_user AS u2
WHERE (account.website_url <> '' AND s1.site_name = 'ebooks' AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c2.site_id = q2.site_id AND c2.post_id = q2.id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.site_id = q2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = tq1.tag_id AND c1.site_id = pl.site_id AND c1.site_id = c2.site_id AND c1.site_id = tq2.site_id AND c1.site_id = q2.site_id AND c1.site_id = tq1.site_id AND pl.site_id = c2.site_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND c2.site_id = tq2.site_id AND c2.site_id = q1.site_id AND c2.site_id = tq1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND q2.site_id = q1.site_id AND q2.site_id = tq1.site_id AND c1.post_id = tq1.question_id AND c1.post_id = pl.post_id_from AND tq1.question_id = pl.post_id_from AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND q1.site_id = s1.site_id AND u1.site_id = q1.site_id AND a1.question_id = pl.post_id_from AND a1.question_id = c1.post_id AND tq2.site_id = u1.site_id AND tq2.site_id = a1.site_id AND tq2.site_id = s1.site_id AND c2.site_id = u1.site_id AND c2.site_id = a1.site_id AND c2.site_id = s1.site_id AND u1.site_id = pl.site_id AND u1.site_id = q2.site_id AND u1.site_id = c1.site_id AND a1.site_id = pl.site_id AND a1.site_id = q2.site_id AND a1.site_id = c1.site_id AND pl.site_id = s1.site_id AND q2.site_id = s1.site_id AND s1.site_id = c1.site_id AND c1.date < c2.date AND a1.creation_date >= q1.creation_date + '1 year'::interval)
