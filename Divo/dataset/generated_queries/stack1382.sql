--stack_templates_generated-48338b6a-9576-4b70-bee3-ec99045ff36e_faa4299f-f54b-3101-80dd-c5d7ebe05948.sql
--{"gen": "erase", "time": 0.6741068363189697, "template": "generated-48338b6a-9576-4b70-bee3-ec99045ff36e", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
question AS q,
tag AS t,
tag AS t1
WHERE (s1.site_name = 'outdoors' AND s2.site_name = 'es' AND q.score >= 0 AND q.score > 14 AND t.name IN ('tables', 'tikz-pgf') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = t.site_id AND u1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND a1.site_id = q.site_id AND tq1.site_id = q.site_id AND t1.site_id = s1.site_id AND t.site_id = s1.site_id AND s1.site_id = q.site_id)
