--stack_templates_generated-6aaa22d8-fb47-493d-8b2b-4b287175bac6_2e2b702a-688e-3d8f-bfc0-75cee358a1e4.sql
--{"gen": "erase", "time": 0.2709801197052002, "template": "generated-6aaa22d8-fb47-493d-8b2b-4b287175bac6", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
question AS q2,
so_user AS u2,
tag AS t2,
tag_question AS tq2,
comment AS c1,
post_link AS pl
WHERE (s1.site_name = 'money' AND t1.name = 'matrix' AND t2.name = 'bash' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND pl.post_id_to = tq2.question_id AND tq2.site_id = c1.site_id AND t1.site_id = pl.site_id AND t1.site_id = c1.site_id AND u1.site_id = pl.site_id AND u1.site_id = c1.site_id AND pl.site_id = s1.site_id AND pl.site_id = c1.site_id AND s1.site_id = c1.site_id AND q2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND c1.post_id = pl.post_id_from AND tq2.site_id = t1.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = a1.site_id AND tq2.site_id = s1.site_id AND tq2.site_id = tq1.site_id AND t1.site_id = t2.site_id AND t1.site_id = u2.site_id AND t1.site_id = q2.site_id AND t2.site_id = u1.site_id AND t2.site_id = q1.site_id AND t2.site_id = a1.site_id AND t2.site_id = pl.site_id AND t2.site_id = s1.site_id AND t2.site_id = tq1.site_id AND t2.site_id = c1.site_id AND u1.site_id = u2.site_id AND u1.site_id = q2.site_id AND q1.site_id = u2.site_id AND q1.site_id = q2.site_id AND u2.site_id = a1.site_id AND u2.site_id = pl.site_id AND u2.site_id = s1.site_id AND u2.site_id = tq1.site_id AND u2.site_id = c1.site_id AND a1.site_id = pl.site_id AND a1.site_id = q2.site_id AND a1.site_id = c1.site_id AND s1.site_id = q2.site_id AND q2.site_id = tq1.site_id AND a1.question_id = pl.post_id_from AND a1.question_id = c1.post_id AND tq2.tag_id = t1.id AND tq2.tag_id = tq1.tag_id AND t1.id = t2.id AND t2.id = tq1.tag_id AND a1.creation_date >= q1.creation_date + '1 year'::interval AND c1.score > q1.score)
