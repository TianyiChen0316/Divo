--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_ef9e7962-2e51-3104-8586-ea620bff10c3.sql
--{"gen": "erase", "time": 0.26488518714904785, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag_question AS tq
WHERE (s.site_name IN ('tex') AND q.score > 12 AND q.score >= 10 AND q.site_id = s.site_id AND tq.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = q.site_id)
