--stack_templates_generated-9b4e032b-0c36-41e6-a359-bf57982c8268_3d4e6787-8782-30cd-a463-1c61c6dedc63.sql
--{"gen": "erase", "time": 0.192535400390625, "template": "generated-9b4e032b-0c36-41e6-a359-bf57982c8268", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
so_user AS u1,
tag_question AS tq1,
site AS s1
WHERE (t.name IN ('tables', 'tikz-pgf') AND s1.site_name = 'stackoverflow' AND tq.tag_id = t.id AND tq.site_id = u1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND tq.site_id = s1.site_id AND t.site_id = s1.site_id)
