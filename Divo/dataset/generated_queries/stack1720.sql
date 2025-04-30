--stack_templates_generated-c1f3d0bc-f307-4f2a-9155-8596fbc55fa6_2dc6b9d0-e49d-3a97-a153-e5ddc01ddfa0.sql
--{"gen": "combine", "time": 0.29683423042297363, "template": "generated-c1f3d0bc-f307-4f2a-9155-8596fbc55fa6", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
site AS s,
tag_question AS tq1,
answer AS a1,
so_user AS u1,
tag AS t1
WHERE (s.site_name IN ('askubuntu', 'math') AND q1.favorite_count <= 5000 AND q1.favorite_count >= 1 AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND u1.downvotes <= 10 AND u1.downvotes <= 10 AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND q1.id = tq1.question_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND q1.owner_user_id = u1.id AND s.site_id = a1.site_id AND s.site_id = t1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.owner_user_id = a1.owner_user_id AND tq1.question_id = a1.question_id)
