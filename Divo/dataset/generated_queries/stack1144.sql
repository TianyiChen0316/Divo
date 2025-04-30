--stack_templates_generated-a370c8ca-5a97-4915-ba77-b102decb255a_e4a6ee8d-18af-336e-aca8-bf579328c421.sql
--{"gen": "erase", "time": 4.675299167633057, "template": "generated-a370c8ca-5a97-4915-ba77-b102decb255a", "dataset": "stack_templates", "rows": 315149}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'serverfault' AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
