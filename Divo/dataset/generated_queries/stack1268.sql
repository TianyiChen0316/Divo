--stack_templates_generated-d2426ce5-a491-443d-95b0-5d50519da91f_fbaddab2-8e69-3be5-9210-2333a13a6092.sql
--{"gen": "erase", "time": 1.0937857627868652, "template": "generated-d2426ce5-a491-443d-95b0-5d50519da91f", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (t.name IN ('tables', 'tikz-pgf') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.score > 6 AND q1.score <= 0 AND u1.reputation <= 10 AND u1.reputation <= 10 AND tq.tag_id = t.id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND q1.id = a1.question_id AND q1.id = tq1.question_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND b.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND b.user_id = a1.owner_user_id)
