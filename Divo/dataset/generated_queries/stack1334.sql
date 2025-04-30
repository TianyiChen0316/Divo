--stack_templates_generated-713e9162-90da-460e-888c-34579dca33e7_a3112bff-4d57-3376-a85b-345f2fd835ca.sql
--{"gen": "combine", "time": 0.8406987190246582, "template": "generated-713e9162-90da-460e-888c-34579dca33e7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
site AS s
WHERE (q.score > 9 AND q.score > 8 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10 AND q1.favorite_count <= 10000 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s.site_name IN ('askubuntu', 'math') AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND tq.site_id = a1.site_id AND t1.site_id = a1.site_id AND u1.site_id = a1.site_id AND q1.site_id = a1.site_id AND t.site_id = a1.site_id AND a1.site_id = tq1.site_id AND a1.site_id = q.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND tq.site_id = s.site_id AND s.site_id = t.site_id AND s.site_id = a1.site_id AND s.site_id = q.site_id AND a1.owner_user_id = b1.user_id AND s.site_id = b1.site_id AND b1.site_id = a1.site_id)
