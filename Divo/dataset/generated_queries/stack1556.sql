--stack_templates_generated-41e1ef9f-706b-4ef3-91a8-ce92c64133a2_9a55d132-6568-3790-a64f-e3b94920186e.sql
--{"gen": "combine", "time": 0.10152649879455566, "template": "generated-41e1ef9f-706b-4ef3-91a8-ce92c64133a2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag_question AS tq,
tag AS t
WHERE (s.site_name IN ('tex') AND q.score <= 0 AND q.score <= 1000 AND t.name IN ('tables', 'tikz-pgf') AND q.site_id = s.site_id AND tq.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = q.site_id AND t.site_id = s.site_id AND tq.tag_id = t.id AND t.site_id = q.site_id AND t.site_id = tq.site_id)
