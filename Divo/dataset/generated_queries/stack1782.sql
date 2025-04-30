--stack_templates_generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61_d618f2ae-9b4d-35ca-9959-1b991fc369b8.sql
--{"gen": "combine", "time": 1.0548405647277832, "template": "generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag_question AS tq1,
question AS q,
tag AS t,
tag_question AS tq,
badge AS b1
WHERE (q1.favorite_count <= 5000 AND q1.favorite_count <= 10000 AND u1.downvotes <= 1 AND u1.downvotes >= 10 AND q.score > 6 AND q.score <= 5 AND t.name IN ('tables', 'tikz-pgf') AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND u1.site_id = q.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND b1.user_id = q1.owner_user_id)
