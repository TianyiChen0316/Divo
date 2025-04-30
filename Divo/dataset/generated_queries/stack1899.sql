--stack_templates_generated-1cbd8d48-8a91-4c39-ad3d-5ae652f65eb8_38f5cc7d-8a29-3738-9322-6a28f37029cd.sql
--{"gen": "erase", "time": 2.9912679195404053, "template": "generated-1cbd8d48-8a91-4c39-ad3d-5ae652f65eb8", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
site AS s,
so_user AS u1,
tag_question AS tq1
WHERE (s.site_name IN ('askubuntu', 'math') AND q1.favorite_count <= 5000 AND q1.favorite_count <= 10 AND u1.downvotes <= 1 AND u1.downvotes <= 10 AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
