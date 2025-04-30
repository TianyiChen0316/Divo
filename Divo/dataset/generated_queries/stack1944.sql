--stack_templates_generated-2cb50983-99d8-4ae1-ac29-84a038c5d308_f6fe5975-a031-3a5e-af40-b6270c0a1d57.sql
--{"gen": "erase", "time": 0.3028113842010498, "template": "generated-2cb50983-99d8-4ae1-ac29-84a038c5d308", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
badge AS b,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
badge AS b2
WHERE (t.name IN ('tables', 'tikz-pgf') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND u1.reputation <= 100000 AND u1.reputation <= 100 AND b2.name = 'Constable' AND b.user_id = u1.id AND u1.site_id = t.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND b.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND b.site_id = a1.site_id AND u1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND u1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND b2.user_id = u1.id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND t.site_id = a1.site_id AND t.site_id = b2.site_id)
