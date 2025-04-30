--stack_templates_q6-072_919c1b87-b2fb-3417-a894-efca1e586698.sql
--{"gen": "combine", "time": 0.37290143966674805, "template": "q6-072", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
question AS q,
tag_question AS tq,
tag AS t
WHERE (s1.site_name = 'spanish' AND t1.name IN ('copyright', 'sunyata') AND q.score > 14 AND q.score > 8 AND t.name IN ('tables', 'tikz-pgf') AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND tq.question_id = q.id AND tq.site_id = q.site_id AND tq.tag_id = t.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = t.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = q.site_id AND q1.site_id = q.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND tq.site_id = s1.site_id AND tq.site_id = c1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND t.site_id = s1.site_id AND t.site_id = c1.site_id AND s1.site_id = q.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND q.site_id = c1.site_id AND tq1.question_id = c1.post_id AND c1.score > q1.score)
