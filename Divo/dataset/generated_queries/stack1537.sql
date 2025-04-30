--stack_templates_generated-1cbd8d48-8a91-4c39-ad3d-5ae652f65eb8_0b70a4fe-633e-32b3-b729-6127011c8a6f.sql
--{"gen": "combine", "time": 0.6258077621459961, "template": "generated-1cbd8d48-8a91-4c39-ad3d-5ae652f65eb8", "dataset": "stack_templates", "rows": 1}
SELECT count(*),
t1.name
FROM question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS acc,
badge AS b1
WHERE (s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count >= 5 AND q1.favorite_count >= 5 AND u1.downvotes <= 10 AND u1.downvotes <= 10 AND acc.website_url ILIKE '%de' AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND acc.id = u1.account_id AND b1.user_id = u1.id AND s.site_id = b1.site_id AND t1.site_id = b1.site_id AND u1.site_id = b1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.owner_user_id = b1.user_id)
 group by t1.name