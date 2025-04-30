--stack_templates_generated-398c2236-4a8d-4286-8ad3-31263a72922f_07f4ed83-8139-3b00-b1f4-65d46ab89451.sql
--{"gen": "erase", "time": 0.10746622085571289, "template": "generated-398c2236-4a8d-4286-8ad3-31263a72922f", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
site AS s,
answer AS a1,
badge AS b
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 5000 AND q1.favorite_count >= 0 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s.site_name IN ('tex') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND t.site_id = s.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND q1.id = a1.question_id AND s.site_id = a1.site_id AND s.site_id = b.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = a1.owner_user_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND b.site_id = tq1.site_id)
