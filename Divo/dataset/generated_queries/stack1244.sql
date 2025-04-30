--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_545b5e86-86d5-3be4-afa1-02777072ccef.sql
--{"gen": "combine", "time": 0.10924792289733887, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag AS t,
tag_question AS tq
WHERE (q.score <= 1000 AND q.score <= 1000 AND s.site_name IN ('tex') AND t.name IN ('tables', 'tikz-pgf') AND q.site_id = s.site_id AND t.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = s.site_id AND tq.tag_id = t.id AND t.site_id = q.site_id AND t.site_id = tq.site_id AND q.site_id = tq.site_id)
