--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_93e4e8b7-ee96-3ca1-a680-a96d3918aa36.sql
--{"gen": "combine", "time": 0.10331511497497559, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
so_user AS u2,
tag AS t1
WHERE (t.name IN ('tables', 'tikz-pgf') AND s1.site_name = 'ru' AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.owner_user_id = a1.owner_user_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND t1.site_id = t.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND t.site_id = tq1.site_id)
