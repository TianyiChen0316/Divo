--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_5e44b79e-ea49-36bf-923c-f07c43d3fcfe.sql
--{"gen": "erase", "time": 0.2680809497833252, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag_question AS tq
WHERE (s.site_name IN ('tex') AND q.score > 13 AND q.score >= 1 AND q.site_id = s.site_id AND tq.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = q.site_id)
