--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_a557be86-7377-39fa-a917-238ab1bdcdd1.sql
--{"gen": "combine", "time": 1.7373197078704834, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM site AS s,
tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (s.site_name IN ('tex') AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 5 AND q1.favorite_count >= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND t.site_id = s.site_id AND tq.site_id = s.site_id AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND tq.site_id = t.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id)
