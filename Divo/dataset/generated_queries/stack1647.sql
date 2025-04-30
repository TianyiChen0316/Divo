--stack_templates_generated-713e9162-90da-460e-888c-34579dca33e7_744e97ab-3944-320a-9f86-c54c47ef3311.sql
--{"gen": "combine", "time": 0.2244274616241455, "template": "generated-713e9162-90da-460e-888c-34579dca33e7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
site AS s1,
so_user AS so_user,
answer AS a1
WHERE (q.score > 12 AND q.score <= 10 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 1 AND q1.favorite_count <= 5000 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s1.site_name = 'woodworking' AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND tq1.site_id = s1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND tq.site_id = so_user.site_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND t.site_id = so_user.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND so_user.site_id = a1.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = tq1.site_id AND so_user.id = q1.owner_user_id AND q1.owner_user_id = a1.owner_user_id AND a1.question_id = q1.id AND t1.site_id = so_user.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND q1.site_id = so_user.site_id AND q1.site_id = a1.site_id AND q1.site_id = s1.site_id AND so_user.site_id = q.site_id AND a1.site_id = q.site_id AND s1.site_id = q.site_id)
