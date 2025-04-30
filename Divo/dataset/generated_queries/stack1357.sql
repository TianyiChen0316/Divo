--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_491e2181-757d-35f0-9479-4a06d7474689.sql
--{"gen": "erase", "time": 0.38722920417785645, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag_question AS tq
WHERE (s.site_name IN ('tex') AND q.score <= 10 AND q.score <= 0 AND q.site_id = s.site_id AND tq.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = q.site_id)
