--stack_templates_generated-1cbd8d48-8a91-4c39-ad3d-5ae652f65eb8_c97899db-eeda-3a8d-8bfa-f0316853844e.sql
--{"gen": "erase", "time": 0.23993873596191406, "template": "generated-1cbd8d48-8a91-4c39-ad3d-5ae652f65eb8", "dataset": "stack_templates", "rows": 4}
SELECT count(*),
t1.name
FROM question AS q1,
site AS s,
tag AS t1,
tag_question AS tq1
WHERE (s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count >= 5 AND q1.favorite_count <= 5000 AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
 group by t1.name