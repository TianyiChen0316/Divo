--stack_templates_q6-072_7725fce3-816b-33f4-bc9e-bbee70dff5ca.sql
--{"gen": "erase", "time": 0.4540684223175049, "template": "q6-072", "dataset": "stack_templates", "rows": 491}
SELECT *
FROM comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = '3dprinting' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c1.post_id = tq1.question_id AND c1.site_id = u1.site_id AND c1.site_id = s1.site_id AND c1.site_id = tq1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND c1.score > q1.score)
