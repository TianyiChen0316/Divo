--stack_templates_generated-cd16d7f0-ba56-4e01-bd34-1ac94e303c18_97b9ca99-1e48-3cc9-ba12-f666411d76cd.sql
--{"gen": "erase", "time": 0.12628602981567383, "template": "generated-cd16d7f0-ba56-4e01-bd34-1ac94e303c18", "dataset": "stack_templates", "rows": 1774}
SELECT *
FROM answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
comment AS c1
WHERE (s1.site_name = 'cstheory' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND u1.site_id = c1.site_id AND a1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND c1.post_id = a1.question_id AND c1.score > q1.score)
