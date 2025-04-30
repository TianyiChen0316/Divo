--stack_templates_generated-44b4248e-d173-416a-a437-3687c41cb74e_13754c27-bd6a-3e67-b8ac-357ce7a59352.sql
--{"gen": "erase", "time": 1.2901475429534912, "template": "generated-44b4248e-d173-416a-a437-3687c41cb74e", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
tag AS t,
tag_question AS tq,
tag AS t1
WHERE (s1.site_name = 'patents' AND s2.site_name = 'freelancing' AND t.name IN ('tables', 'tikz-pgf') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND tq.tag_id = t.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = a1.site_id AND t.site_id = tq1.site_id AND tq.site_id = s1.site_id AND t1.site_id = s1.site_id AND t.site_id = s1.site_id)
