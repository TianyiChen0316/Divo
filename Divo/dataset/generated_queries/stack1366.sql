--stack_templates_generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61_e0667ef4-b325-39d0-b740-5486632d9535.sql
--{"gen": "combine", "time": 0.36844539642333984, "template": "generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag_question AS tq1,
site AS s,
tag AS t1
WHERE (q1.favorite_count <= 1 AND q1.favorite_count >= 0 AND u1.downvotes <= 1 AND u1.downvotes <= 1 AND s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id)
