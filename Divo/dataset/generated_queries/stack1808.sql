--stack_templates_ff8e9a7c5dc15a17287f917e101f0e5f2987b296_1cd5f9cf-f189-3f46-899d-5137188b44e5.sql
--{"gen": "erase", "time": 0.23689699172973633, "template": "ff8e9a7c5dc15a17287f917e101f0e5f2987b296", "dataset": "stack_templates", "rows": 4}
SELECT count(*),
t1.name
FROM question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count <= 10 AND q1.favorite_count >= 5 AND u1.downvotes >= 0 AND u1.downvotes >= 0 AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
 group by t1.name