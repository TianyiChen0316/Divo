--stack_templates_generated-90b2de1f-6122-4929-a045-07e2759e5c2e_f67ac553-f7fb-358e-b193-6fcb628de0f8.sql
--{"gen": "erase", "time": 0.1350553035736084, "template": "generated-90b2de1f-6122-4929-a045-07e2759e5c2e", "dataset": "stack_templates", "rows": 2}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
so_user AS u1,
tag_question AS tq1,
comment AS c1,
site AS s1
WHERE (b1.name = 'Caucus' AND b2.name = 'Commentator' AND q1.favorite_count >= 0 AND q1.favorite_count <= 10 AND s1.site_name = 'apple' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = c1.post_id AND u1.site_id = s1.site_id AND u1.site_id = c1.site_id AND b1.site_id = s1.site_id AND b1.site_id = c1.site_id AND b2.site_id = s1.site_id AND b2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND s1.site_id = so_user.site_id AND s1.site_id = c1.site_id AND so_user.site_id = c1.site_id AND b2.date > b1.date + '11 months'::interval AND c1.score > q1.score)
