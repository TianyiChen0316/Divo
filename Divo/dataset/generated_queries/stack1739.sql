--stack_templates_generated-d76dbc2b-ecf5-4bd1-935a-36029704a09a_e758afda-9ce7-323c-a9a2-3126e81e0290.sql
--{"gen": "erase", "time": 0.12613725662231445, "template": "generated-d76dbc2b-ecf5-4bd1-935a-36029704a09a", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM site AS s,
tag AS t,
tag_question AS tq,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (s.site_name IN ('tex') AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 5000 AND q1.favorite_count >= 5 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND t.site_id = s.site_id AND tq.site_id = s.site_id AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND tq.site_id = t.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id)
