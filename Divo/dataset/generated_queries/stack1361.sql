--stack_templates_q6-072_f8cacb9c-c394-33ee-b959-c199b026fedb.sql
--{"gen": "combine", "time": 1.5635995864868164, "template": "q6-072", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b1,
badge AS b2,
so_user AS so_user,
site AS s
WHERE (s1.site_name = 'ebooks' AND t1.name IN ('copyright', 'sunyata') AND b1.name = 'Illuminator' AND b2.name = 'Caucus' AND s.site_name IN ('askubuntu', 'math') AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND t1.site_id = b1.site_id AND t1.site_id = b2.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND t1.site_id = s.site_id AND s.site_id = b1.site_id AND s.site_id = b2.site_id AND s.site_id = so_user.site_id AND so_user.account_id = u1.account_id AND tq1.question_id = c1.post_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND s.site_id = s1.site_id AND s.site_id = c1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND b1.site_id = s1.site_id AND b1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = c1.site_id AND b2.site_id = s1.site_id AND b2.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c1.score > q1.score AND b2.date > b1.date + '11 months'::interval)
