--stack_templates_generated-44b4248e-d173-416a-a437-3687c41cb74e_84ebacc8-a336-39af-9ac4-84e4f470ceba.sql
--{"gen": "erase", "time": 0.8790771961212158, "template": "generated-44b4248e-d173-416a-a437-3687c41cb74e", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
question AS q,
tag AS t,
tag AS t1
WHERE (s1.site_name = 'ebooks' AND s2.site_name = 'mathoverflow' AND q.score >= 1 AND q.score > 11 AND t.name IN ('tables', 'tikz-pgf') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.site_id = s2.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = t.site_id AND u1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND a1.site_id = q.site_id AND tq1.site_id = q.site_id AND t1.site_id = s1.site_id AND t.site_id = s1.site_id AND s1.site_id = q.site_id)
