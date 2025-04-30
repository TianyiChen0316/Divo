--stack_templates_q4-075_ebe9b716-2bcb-32f0-8d19-88894bdcef65.sql
--{"gen": "combine", "time": 2.660226583480835, "template": "q4-075", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
comment AS c1,
comment AS c2,
post_link AS pl,
question AS q2,
tag_question AS tq2
WHERE (s1.site_name = 'rpg' AND t1.name = '16.04' AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND c2.post_id = q2.id AND c2.site_id = q2.site_id AND pl.post_id_from = q1.id AND pl.post_id_to = q2.id AND pl.site_id = q1.site_id AND pl.site_id = q2.site_id AND tq2.question_id = q2.id AND tq2.site_id = q2.site_id AND tq1.tag_id = tq2.tag_id AND tq2.tag_id = t1.id AND tq2.site_id = c2.site_id AND tq2.site_id = t1.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = s1.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = t1.site_id AND c2.site_id = u1.site_id AND c2.site_id = q1.site_id AND c2.site_id = pl.site_id AND c2.site_id = s1.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = pl.site_id AND t1.site_id = q2.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = q1.site_id AND u1.site_id = pl.site_id AND u1.site_id = s1.site_id AND u1.site_id = q2.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = q2.site_id AND q1.site_id = tq1.site_id AND pl.site_id = s1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND s1.site_id = q2.site_id AND s1.site_id = c1.site_id AND q2.site_id = tq1.site_id AND q2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = pl.post_id_from AND tq1.question_id = c1.post_id AND pl.post_id_from = c1.post_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND c1.date < c2.date)
