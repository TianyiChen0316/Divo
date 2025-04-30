--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_473ce22e-7f2d-3026-a64a-74d53ba3a670.sql
--{"gen": "combine", "time": 0.11249589920043945, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag AS t,
tag_question AS tq
WHERE (q.score <= 5 AND q.score >= 10 AND s.site_name IN ('tex') AND t.name IN ('tables', 'tikz-pgf') AND q.site_id = s.site_id AND t.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = s.site_id AND tq.tag_id = t.id AND t.site_id = q.site_id AND t.site_id = tq.site_id AND q.site_id = tq.site_id)
