--stack_templates_generated-dbb475d1-60c0-400e-9f6b-12d4bdbde206_fbaddab2-8e69-3be5-9210-2333a13a6092.sql
--{"gen": "erase", "time": 2.9841365814208984, "template": "generated-dbb475d1-60c0-400e-9f6b-12d4bdbde206", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (t.name IN ('tables', 'tikz-pgf') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.score <= 5 AND q1.score > 9 AND u1.reputation >= 10 AND u1.reputation <= 100000 AND b.user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND b.site_id = tq1.site_id)
