--stack_templates_q4-075_a86ca3b2-e686-3f98-a543-355aff0e70e1.sql
--{"gen": "combine", "time": 0.3685579299926758, "template": "q4-075", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
tag AS t,
tag_question AS tq,
badge AS b1
WHERE (s1.site_name = 'pets' AND t1.name = 'ecg' AND t.name IN ('tables', 'tikz-pgf') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = b1.site_id AND t1.site_id = t.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND q1.site_id = tq1.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
