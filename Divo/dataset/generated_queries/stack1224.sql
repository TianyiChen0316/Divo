--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_101ebf94-7c1e-3c2e-b90c-2f1343708e50.sql
--{"gen": "erase", "time": 0.2540922164916992, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag_question AS tq
WHERE (s.site_name IN ('tex') AND q.score > 14 AND q.score > 8 AND q.site_id = s.site_id AND tq.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = q.site_id)
