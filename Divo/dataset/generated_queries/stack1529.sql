--stack_templates_generated-45d9f56b-60b1-4624-9a54-518fe8927e89_14e01bc8-6591-3d19-b72d-ef97f3923af8.sql
--{"gen": "erase", "time": 3.0900092124938965, "template": "generated-45d9f56b-60b1-4624-9a54-518fe8927e89", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM badge AS b1,
question AS q1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
badge AS b,
badge AS b2,
so_user AS so_user
WHERE (q1.favorite_count <= 10000 AND q1.favorite_count <= 5000 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND b2.name = 'Documentation Beta' AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = b2.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b1.site_id = a1.site_id AND b1.site_id = b.site_id AND a1.site_id = so_user.site_id AND a1.site_id = b2.site_id AND so_user.site_id = b.site_id AND b2.site_id = b.site_id AND so_user.id = b.user_id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND b.user_id = b1.user_id AND b1.user_id = a1.owner_user_id AND q1.owner_user_id = b1.user_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND b2.date > b1.date + '11 months'::interval)
