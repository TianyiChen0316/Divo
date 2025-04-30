--stack_templates_generated-85653c38-f9cb-4a5b-b02d-0f4906260b80_95aa0fe9-d4d7-3585-8f19-6ab784477409.sql
--{"gen": "erase", "time": 1.612154483795166, "template": "generated-85653c38-f9cb-4a5b-b02d-0f4906260b80", "dataset": "stack_templates", "rows": 33}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
question AS q2,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'vegetarianism' AND t2.name = 'clothing' AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.owner_user_id = a1.owner_user_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
