--stack_templates_generated-5d562e12-87d3-4ce2-9bcf-d98c7ce9f1d1_cc8b93e9-dc71-32f7-aafa-a3bff45d9d69.sql
--{"gen": "combine", "time": 3.9168810844421387, "template": "generated-5d562e12-87d3-4ce2-9bcf-d98c7ce9f1d1", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2,
tag AS t1,
tag AS t2,
tag_question AS tq2
WHERE (t.name IN ('tables', 'tikz-pgf') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.score <= 5 AND q1.score <= 1000 AND u1.reputation <= 100 AND u1.reputation <= 100 AND t1.name = '.profile' AND t2.name = 'vb.net' AND b.user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND b.site_id = tq1.site_id AND tq1.tag_id = t1.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND u1.site_id = t1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND tq2.site_id = t2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = u2.site_id AND t1.site_id = t.site_id AND t1.site_id = b.site_id)
