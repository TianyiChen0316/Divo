--stack_templates_generated-4bad659e-2d32-4a2b-9151-7246d443a7e6_984bbd0e-6253-3f8a-9ee3-3e8b31caab38.sql
--{"gen": "erase", "time": 0.5080182552337646, "template": "generated-4bad659e-2d32-4a2b-9151-7246d443a7e6", "dataset": "stack_templates", "rows": 8133}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'civicrm' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
