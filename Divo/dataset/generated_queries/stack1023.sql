--stack_templates_generated-4bad659e-2d32-4a2b-9151-7246d443a7e6_b9bcef7c-bcf5-300d-8f0b-94fef03f818f.sql
--{"gen": "erase", "time": 0.5564861297607422, "template": "generated-4bad659e-2d32-4a2b-9151-7246d443a7e6", "dataset": "stack_templates", "rows": 7702}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'pm' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
