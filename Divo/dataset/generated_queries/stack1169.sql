--stack_templates_q6-072_fbd1bae6-7136-3921-b66c-45391622295b.sql
--{"gen": "combine", "time": 0.10013508796691895, "template": "q6-072", "dataset": "stack_templates", "rows": 1}
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
so_user AS so_user
WHERE (s1.site_name = 'serverfault' AND t1.name IN ('copyright', 'sunyata') AND b1.name = 'Constable' AND b2.name = 'API Evangelist' AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = b2.user_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND so_user.account_id = u1.account_id AND tq1.question_id = c1.post_id AND b1.site_id = b2.site_id AND c1.score > q1.score AND b2.date > b1.date + '11 months'::interval)
