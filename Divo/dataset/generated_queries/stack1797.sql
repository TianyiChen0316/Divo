--stack_templates_ff8e9a7c5dc15a17287f917e101f0e5f2987b296_9a0d4cad-a1ba-3bf4-acc1-1041b8daeaca.sql
--{"gen": "erase", "time": 0.28554725646972656, "template": "ff8e9a7c5dc15a17287f917e101f0e5f2987b296", "dataset": "stack_templates", "rows": 4}
SELECT count(*),
t1.name
FROM question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count <= 5000 AND q1.favorite_count >= 5 AND u1.downvotes >= 0 AND u1.downvotes >= 10 AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
 group by t1.name