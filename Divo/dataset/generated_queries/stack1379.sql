--stack_templates_generated-df03f412-ca53-4ded-8ec4-70f49e87950f_ddc4a955-65dd-37ca-9834-fb7d38262370.sql
--{"gen": "erase", "time": 0.1844170093536377, "template": "generated-df03f412-ca53-4ded-8ec4-70f49e87950f", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
so_user AS u1,
tag_question AS tq1,
site AS s1
WHERE (t.name IN ('tables', 'tikz-pgf') AND s1.site_name = 'softwareengineering' AND tq.tag_id = t.id AND tq.site_id = u1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND tq.site_id = s1.site_id AND t.site_id = s1.site_id)
