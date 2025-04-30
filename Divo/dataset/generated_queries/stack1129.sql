--stack_templates_generated-bff7d499-a101-4b92-a6e9-a5220a76ecdd_0b5f6299-2eae-33b6-8fff-bed8fb025231.sql
--{"gen": "erase", "time": 0.3306467533111572, "template": "generated-bff7d499-a101-4b92-a6e9-a5220a76ecdd", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag_question AS tq1,
site AS s1
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10000 AND q1.favorite_count <= 10000 AND s1.site_name = 'esperanto' AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND tq.site_id = s1.site_id AND b1.site_id = s1.site_id AND t.site_id = s1.site_id)
