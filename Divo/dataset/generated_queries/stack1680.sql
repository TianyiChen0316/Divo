--stack_templates_generated-914cb52f-b599-4171-a659-eeea4ab37002_4a80abf0-8162-3eb5-846a-1664e006d9a2.sql
--{"gen": "combine", "time": 0.18143606185913086, "template": "generated-914cb52f-b599-4171-a659-eeea4ab37002", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
site AS s1,
so_user AS u1,
tag_question AS tq1,
tag AS t,
tag_question AS tq,
badge AS b1,
so_user AS so_user,
answer AS a1,
badge AS b2,
question AS q,
site AS s
WHERE (s1.site_name = 'bitcoin' AND t.name IN ('tables', 'tikz-pgf') AND b2.name = 'Commentator' AND q.score > 11 AND q.score >= 1 AND s.site_name IN ('tex') AND tq1.site_id = s1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND tq.site_id = so_user.site_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND t.site_id = so_user.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND so_user.site_id = a1.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = tq1.site_id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = a1.owner_user_id AND tq.site_id = b2.site_id AND u1.site_id = b2.site_id AND t.site_id = b2.site_id AND a1.site_id = b2.site_id AND s1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q.site_id = s.site_id AND t.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = s.site_id AND tq.site_id = q.site_id AND s.site_id = u1.site_id AND s.site_id = b1.site_id AND s.site_id = so_user.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND s.site_id = b2.site_id AND s.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = q.site_id AND t.site_id = q.site_id AND so_user.site_id = q.site_id AND a1.site_id = q.site_id AND s1.site_id = q.site_id AND b2.site_id = q.site_id AND tq1.site_id = q.site_id AND b2.date > b1.date + '11 months'::interval)
