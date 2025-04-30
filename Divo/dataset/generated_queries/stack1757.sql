--stack_templates_generated-90b2de1f-6122-4929-a045-07e2759e5c2e_d1608c20-2217-34a4-94c3-c0ac21b7a07a.sql
--{"gen": "erase", "time": 0.6625232696533203, "template": "generated-90b2de1f-6122-4929-a045-07e2759e5c2e", "dataset": "stack_templates", "rows": 6714}
SELECT *
FROM badge AS b1,
badge AS b2,
question AS q1,
so_user AS u1,
tag_question AS tq1,
comment AS c1,
site AS s1
WHERE (b1.name = 'Commentator' AND b2.name = 'Nice Question' AND q1.favorite_count <= 10000 AND q1.favorite_count >= 0 AND s1.site_name = 'aviation' AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = c1.post_id AND u1.site_id = s1.site_id AND u1.site_id = c1.site_id AND b1.site_id = s1.site_id AND b1.site_id = c1.site_id AND b2.site_id = s1.site_id AND b2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND s1.site_id = c1.site_id AND b2.date > b1.date + '11 months'::interval AND c1.score > q1.score)
