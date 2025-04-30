--stack_templates_generated-add2be36-6f15-465a-b655-0de5adfb1d47_f92ef419-40b3-3eb9-ae5d-12a2f19910d2.sql
--{"gen": "combine", "time": 0.21268081665039062, "template": "generated-add2be36-6f15-465a-b655-0de5adfb1d47", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
question AS q2,
site AS s2,
so_user AS u2,
site AS s,
tag AS t1
WHERE (s1.site_name = 'computergraphics' AND s2.site_name = 'apple' AND s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.site_id = s2.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND s2.site_id = u2.site_id AND account.id = u2.account_id AND q1.owner_user_id = a1.owner_user_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id)
