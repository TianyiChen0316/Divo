--stack_templates_generated-ccad9bc8-3301-439d-95f7-6c1eb32e5b4f_2faa1574-6f1e-3034-b4b7-2b649d2ed9ce.sql
--{"gen": "erase", "time": 0.9514734745025635, "template": "generated-ccad9bc8-3301-439d-95f7-6c1eb32e5b4f", "dataset": "stack_templates", "rows": 268468}
SELECT *
FROM comment AS c1,
site AS s1,
tag_question AS tq1
WHERE (s1.site_name = 'codereview' AND tq1.site_id = s1.site_id AND c1.post_id = tq1.question_id AND c1.site_id = s1.site_id AND c1.site_id = tq1.site_id)
