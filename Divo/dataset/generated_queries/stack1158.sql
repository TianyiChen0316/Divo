--stack_templates_generated-fb8d02fb-691a-4784-8f30-5f1cfba49bb9_4b63182d-e411-3dff-9b18-b00ec76e44ab.sql
--{"gen": "erase", "time": 1.0701582431793213, "template": "generated-fb8d02fb-691a-4784-8f30-5f1cfba49bb9", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
answer AS a1,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (q.score > 11 AND q.score > 15 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 5 AND q1.favorite_count <= 10 AND u1.downvotes >= 10 AND u1.downvotes <= 1 AND tq.question_id = q.id AND tq.tag_id = t.id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = a1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND a1.site_id = tq1.site_id AND a1.site_id = q.site_id AND tq1.site_id = q.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id)
