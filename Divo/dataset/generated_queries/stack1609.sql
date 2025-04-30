--stack_templates_generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61_ef036a01-56f1-3008-b257-17ef8c8c4a60.sql
--{"gen": "combine", "time": 0.32942795753479004, "template": "generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag_question AS tq1,
question AS q,
tag_question AS tq,
tag AS t,
tag AS t1
WHERE (q1.favorite_count >= 1 AND q1.favorite_count <= 10 AND u1.downvotes <= 100000 AND u1.downvotes <= 10 AND q.score > 11 AND q.score >= 1 AND t.name IN ('tables', 'tikz-pgf') AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND tq.question_id = q.id AND tq.site_id = q.site_id AND tq.tag_id = t.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = q.site_id AND q1.site_id = q.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id)
