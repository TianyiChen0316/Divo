--stack_templates_ff8e9a7c5dc15a17287f917e101f0e5f2987b296_69f6fbc6-1896-36d5-8e1d-da0fd0737ad7.sql
--{"gen": "erase", "time": 0.30373239517211914, "template": "ff8e9a7c5dc15a17287f917e101f0e5f2987b296", "dataset": "stack_templates", "rows": 4}
SELECT count(*),
t1.name
FROM question AS q1,
site AS s,
tag AS t1,
tag_question AS tq1
WHERE (s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count >= 5 AND q1.favorite_count <= 10000 AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
 group by t1.name