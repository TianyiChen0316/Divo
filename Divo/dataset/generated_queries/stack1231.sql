--stack_templates_q4-075_612cce5d-a857-3076-9e77-3b224ea77031.sql
--{"gen": "erase", "time": 1.775162696838379, "template": "q4-075", "dataset": "stack_templates", "rows": 30058}
SELECT *
FROM answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'askubuntu' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
