--stack_templates_generated-ca18d233-6ce6-4db1-8563-9438674565c3_5b0abe73-7483-31e2-967a-149187646ced.sql
--{"gen": "erase", "time": 2.2375643253326416, "template": "generated-ca18d233-6ce6-4db1-8563-9438674565c3", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM badge AS b1,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
badge AS b,
badge AS b2,
tag AS t,
tag_question AS tq
WHERE (q1.favorite_count >= 5 AND q1.favorite_count <= 1 AND s.site_name = 'sharepoint' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND b2.name = 'Epic' AND t.name IN ('tables', 'tikz-pgf') AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND s.site_id = a1.site_id AND tq1.question_id = a1.question_id AND a1.owner_user_id = b1.user_id AND a1.owner_user_id = q1.owner_user_id AND b1.user_id = q1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = a1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = tq1.site_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND a1.owner_user_id = b.user_id AND u1.site_id = b2.site_id AND b1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b1.site_id = b.site_id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND q1.owner_user_id = b.user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND b.user_id = b1.user_id AND tq.tag_id = t.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND t1.site_id = t.site_id AND t1.site_id = b.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND tq.site_id = b1.site_id AND tq.site_id = b2.site_id AND t1.site_id = b2.site_id AND b1.site_id = t.site_id AND t.site_id = b2.site_id AND tq.site_id = s.site_id AND s.site_id = t.site_id AND s.site_id = b2.site_id AND s.site_id = b.site_id AND b2.date > b1.date + '11 months'::interval)
