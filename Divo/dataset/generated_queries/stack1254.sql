--stack_templates_q6-072_e133452f-4f66-3c36-94a8-18d861a94426.sql
--{"gen": "erase", "time": 1.2882130146026611, "template": "q6-072", "dataset": "stack_templates", "rows": 7226}
SELECT *
FROM comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'magento' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c1.post_id = tq1.question_id AND c1.site_id = u1.site_id AND c1.site_id = s1.site_id AND c1.site_id = tq1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND c1.score > q1.score)
