--stack_templates_q4-075_80b90a04-f912-3709-a4ff-6b16242270d2.sql
--{"gen": "erase", "time": 0.9463348388671875, "template": "q4-075", "dataset": "stack_templates", "rows": 9216}
SELECT *
FROM answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'english' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
