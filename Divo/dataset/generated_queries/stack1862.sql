--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_f6d31c90-cb7e-3446-be6c-4e7dc3cb4a64.sql
--{"gen": "erase", "time": 0.2899963855743408, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag_question AS tq
WHERE (s.site_name IN ('tex') AND q.score >= 10 AND q.score > 15 AND q.site_id = s.site_id AND tq.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = q.site_id)
