--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_042362cf-1301-3468-9a21-a40035ff7f1f.sql
--{"gen": "erase", "time": 0.27121829986572266, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag_question AS tq
WHERE (s.site_name IN ('tex') AND q.score <= 5 AND q.score > 14 AND q.site_id = s.site_id AND tq.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = q.site_id)
