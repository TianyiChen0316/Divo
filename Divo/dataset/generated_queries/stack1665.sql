--stack_templates_generated-1cbd8d48-8a91-4c39-ad3d-5ae652f65eb8_77b4067b-d83b-3eb4-b96b-8788f0fe1626.sql
--{"gen": "erase", "time": 0.3692810535430908, "template": "generated-1cbd8d48-8a91-4c39-ad3d-5ae652f65eb8", "dataset": "stack_templates", "rows": 4}
SELECT count(*),
t1.name
FROM question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count <= 10000 AND q1.favorite_count >= 1 AND u1.downvotes >= 0 AND u1.downvotes <= 1 AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
 group by t1.name