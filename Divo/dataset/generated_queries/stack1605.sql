--stack_templates_generated-17e4b784-140f-49bd-93f2-50924b35b826_ce9b7ad2-b3d8-3006-91b1-6cf88d52ff2f.sql
--{"gen": "combine", "time": 0.7778267860412598, "template": "generated-17e4b784-140f-49bd-93f2-50924b35b826", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM site AS s,
tag_question AS tq,
tag AS t,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1
WHERE (s.site_name IN ('tex') AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 1 AND q1.favorite_count <= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND tq.site_id = s.site_id AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = q1.site_id AND s.site_id = t.site_id AND s.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND s.site_id = a1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND tq.site_id = a1.site_id AND t1.site_id = a1.site_id AND u1.site_id = a1.site_id AND q1.site_id = a1.site_id AND t.site_id = a1.site_id AND a1.site_id = tq1.site_id)
