--stack_templates_q1-097_a0e48df3-2891-3a0c-b63b-4a2d5e4c8b9f.sql
--{"gen": "erase", "time": 0.24682116508483887, "template": "q1-097", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS question,
site AS site,
tag AS tag
WHERE (site.site_name = 'tex' AND tag.name = 'filter' AND tag.site_id = site.site_id AND question.site_id = site.site_id AND tag.site_id = question.site_id)
