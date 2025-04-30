--stack_templates_q3-075_baa8923c-b1d9-3af3-8f13-8d037a23547d.sql
--{"gen": "erase", "time": 2.1982364654541016, "template": "q3-075", "dataset": "stack_templates", "rows": 4457}
SELECT *
FROM answer AS a1,
question AS q1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1
WHERE (s1.site_name = 'academia' AND s2.site_name = 'dba' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.site_id = s2.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND s2.site_id = u2.site_id)
