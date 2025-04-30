--stack_templates_generated-41e1ef9f-706b-4ef3-91a8-ce92c64133a2_bef53ecc-5ad4-384e-9859-108c9ae5bb43.sql
--{"gen": "combine", "time": 0.2933681011199951, "template": "generated-41e1ef9f-706b-4ef3-91a8-ce92c64133a2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag_question AS tq
WHERE (s.site_name IN ('tex') AND q.score > 7 AND q.score >= 1 AND q.site_id = s.site_id AND tq.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = q.site_id)
