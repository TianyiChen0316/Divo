--stack_templates_generated-d76dbc2b-ecf5-4bd1-935a-36029704a09a_531afd9b-caae-3095-a1bb-fb9f87294e5e.sql
--{"gen": "combine", "time": 0.23205900192260742, "template": "generated-d76dbc2b-ecf5-4bd1-935a-36029704a09a", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM site AS s,
tag AS t,
tag_question AS tq,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
comment AS c1,
site AS s1,
answer AS a1,
so_user AS u2
WHERE (s.site_name IN ('tex') AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 5000 AND q1.favorite_count >= 5 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s1.site_name = 'woodworking' AND t.site_id = s.site_id AND tq.site_id = s.site_id AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND tq.site_id = t.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND a1.site_id = c1.site_id AND q1.owner_user_id = a1.owner_user_id AND c1.post_id = a1.question_id AND t1.site_id = a1.site_id AND t1.site_id = c1.site_id AND u1.site_id = s1.site_id AND u1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND tq.site_id = c1.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND s.site_id = c1.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND t.site_id = c1.site_id AND c1.score > q1.score AND a1.creation_date >= q1.creation_date + '1 year'::interval)
