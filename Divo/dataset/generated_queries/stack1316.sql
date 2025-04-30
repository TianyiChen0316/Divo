--stack_templates_q6-072_d059d00a-f8b2-3e54-b932-36c98a869d3e.sql
--{"gen": "combine", "time": 1.4958279132843018, "template": "q6-072", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
tag AS t,
badge AS b2,
answer AS a1,
badge AS b
WHERE (s1.site_name = '3dprinting' AND t1.name IN ('copyright', 'sunyata') AND t.name IN ('tables', 'tikz-pgf') AND b2.name = 'API Beta' AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND t1.site_id = a1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND t1.site_id = t.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = a1.site_id AND t.site_id = b2.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND tq1.question_id = c1.post_id AND c1.post_id = a1.question_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND t.site_id = s1.site_id AND t.site_id = c1.site_id AND a1.site_id = s1.site_id AND a1.site_id = c1.site_id AND b2.site_id = s1.site_id AND b2.site_id = c1.site_id AND s1.site_id = b.site_id AND s1.site_id = c1.site_id AND b.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c1.score > q1.score)
