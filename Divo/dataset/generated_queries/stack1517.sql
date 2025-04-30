--stack_templates_q3-075_fa3fdd29-0a6d-3239-9dfa-0d51b19abdf1.sql
--{"gen": "combine", "time": 0.23172450065612793, "template": "q3-075", "dataset": "stack_templates", "rows": 1}
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
tag AS t,
tag_question AS tq,
badge AS b1
WHERE (s1.site_name = 'diy' AND s2.site_name = 'ai' AND t1.name = 'vector-spaces' AND t2.name = 'containstable' AND t.name IN ('tables', 'tikz-pgf') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = s2.site_id AND q2.site_id = u2.site_id AND t1.site_id = s1.site_id AND t2.site_id = s2.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND tq2.question_id = q2.id AND tq2.site_id = s2.site_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = b1.site_id AND t1.site_id = t.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND b1.user_id = a1.owner_user_id AND account.id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND s2.site_id = u2.site_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = a1.owner_user_id)
