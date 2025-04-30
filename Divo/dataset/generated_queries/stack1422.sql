--stack_templates_generated-63f3b21b-e125-48ef-9e1c-af7feaf27b43_da8bdb0a-dd15-3964-a74c-105d4a63920a.sql
--{"gen": "erase", "time": 1.7319438457489014, "template": "generated-63f3b21b-e125-48ef-9e1c-af7feaf27b43", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM badge AS b1,
question AS q1,
so_user AS u1,
tag_question AS tq1,
badge AS b2,
so_user AS so_user
WHERE (q1.favorite_count <= 10 AND q1.favorite_count >= 5 AND b2.name = 'API Beta' AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = b2.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND q1.owner_user_id = b1.user_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND b2.date > b1.date + '11 months'::interval)
