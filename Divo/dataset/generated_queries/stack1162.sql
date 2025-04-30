--stack_templates_generated-11fed098-a005-4574-9791-d4153030fa93_451357ac-4c1a-360c-89e2-ffa85cd2f911.sql
--{"gen": "erase", "time": 0.9202864170074463, "template": "generated-11fed098-a005-4574-9791-d4153030fa93", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (q1.favorite_count <= 10 AND q1.favorite_count >= 0 AND u1.downvotes <= 1 AND u1.downvotes >= 10 AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
