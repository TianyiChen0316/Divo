--stack_templates_q7-043_393afe19-437d-33c8-b142-77a90626cd70.sql
--{"gen": "combine", "time": 0.10386967658996582, "template": "q7-043", "dataset": "stack_templates", "rows": 3}
SELECT *
FROM badge AS b2,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
badge AS b
WHERE (b2.name = 'Famous Question' AND q1.favorite_count <= 10000 AND q1.favorite_count <= 10000 AND s.site_name = 'ru' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND t1.site_id = a1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND s.site_id = a1.site_id AND s.site_id = b2.site_id AND s.site_id = b.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
