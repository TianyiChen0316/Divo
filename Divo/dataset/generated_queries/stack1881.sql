--stack_templates_generated-4872bc71-f400-46d5-a7da-6ce158eacf39_83ab5a10-a391-33e5-bad3-723e0fc1ef95.sql
--{"gen": "combine", "time": 1.0316240787506104, "template": "generated-4872bc71-f400-46d5-a7da-6ce158eacf39", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag AS t1,
tag AS t2,
tag_question AS tq1,
tag_question AS tq2,
badge AS b,
question AS q,
tag AS t,
tag_question AS tq
WHERE (s1.site_name = 'civicrm' AND s2.site_name = 'freelancing' AND t1.name = 'select' AND t2.name = 'jquery-ui' AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q.score >= 10 AND q.score >= 10 AND t.name IN ('tables', 'tikz-pgf') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = s2.site_id AND q2.site_id = u2.site_id AND t1.site_id = s1.site_id AND t2.site_id = s2.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND tq2.question_id = q2.id AND tq2.site_id = s2.site_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND a1.owner_user_id = b.user_id AND tq.question_id = q.id AND tq.tag_id = t.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = t.site_id AND t1.site_id = q.site_id AND u1.site_id = t.site_id AND u1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND a1.site_id = q.site_id AND b.site_id = q.site_id AND tq1.site_id = q.site_id AND account.id = u2.account_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND s2.site_id = u2.site_id AND tq.site_id = s1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND t.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND s1.site_id = b.site_id AND s1.site_id = q.site_id)
