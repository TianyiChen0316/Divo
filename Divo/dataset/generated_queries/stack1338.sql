--stack_templates_generated-e14ed774-e827-4ec0-9afb-d1082b29ac04_4319b877-e31f-3a4e-a55e-3c464f25730c.sql
--{"gen": "erase", "time": 0.11069846153259277, "template": "generated-e14ed774-e827-4ec0-9afb-d1082b29ac04", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
site AS s1,
so_user AS so_user
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 1 AND q1.favorite_count <= 10000 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s1.site_name = 'ebooks' AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND t1.site_id = a1.site_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id)
