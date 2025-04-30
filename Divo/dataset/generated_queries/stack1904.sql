--stack_templates_q1-097_13928d92-6ff0-3634-bcfd-d31f0a8436fd.sql
--{"gen": "erase", "time": 1.0589032173156738, "template": "q1-097", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS question,
site AS site,
tag AS tag
WHERE (site.site_name = 'stackoverflow' AND tag.name = 'calculus' AND tag.site_id = site.site_id AND question.site_id = site.site_id AND tag.site_id = question.site_id)
