--stack_templates_q4-075_655c9729-2e01-3516-8b81-5aafb6eb11fc.sql
--{"gen": "erase", "time": 10.909703254699707, "template": "q4-075", "dataset": "stack_templates", "rows": 1208259}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (s1.site_name = 'tor' AND t1.name = 'ubuntu' AND t1.site_id = s1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.tag_id = t1.id AND u1.site_id = s1.site_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
