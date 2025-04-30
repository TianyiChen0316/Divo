--stack_templates_generated-8735443c-2483-4a4e-8366-3cd9ae328a48_cd2591a2-5450-3d23-a4d4-4366bcb7e5ff.sql
--{"gen": "erase", "time": 1.688460350036621, "template": "generated-8735443c-2483-4a4e-8366-3cd9ae328a48", "dataset": "stack_templates", "rows": 4}
SELECT count(*),
t1.name
FROM answer AS a1,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
so_user AS u2,
tag AS t2
WHERE (q1.favorite_count >= 1 AND q1.favorite_count >= 5 AND s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND u1.downvotes <= 100000 AND u1.downvotes >= 10 AND t2.name = 'replace' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = a1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND u1.account_id = u2.account_id AND t2.site_id = u2.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id)
 group by t1.name