--stack_templates_generated-0014f8ef-6ab2-4f67-b1f1-08fc759f55ff_613faa71-f870-3a99-a6b3-41bbf05debc4.sql
--{"gen": "erase", "time": 2.406952381134033, "template": "generated-0014f8ef-6ab2-4f67-b1f1-08fc759f55ff", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
site AS s1,
comment AS c1,
answer AS a1,
badge AS b
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 1 AND q1.favorite_count <= 10000 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s1.site_name = 'health' AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND tq.site_id = s1.site_id AND t1.site_id = s1.site_id AND b1.site_id = s1.site_id AND t.site_id = s1.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND q1.id = a1.question_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND u1.site_id = c1.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND a1.site_id = s1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND a1.site_id = c1.site_id AND s1.site_id = b.site_id AND s1.site_id = c1.site_id AND b.site_id = tq1.site_id AND b.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND tq1.question_id = a1.question_id AND c1.post_id = a1.question_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = a1.owner_user_id AND b.user_id = b1.user_id AND b1.user_id = a1.owner_user_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = c1.site_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND t1.site_id = c1.site_id AND b1.site_id = a1.site_id AND b1.site_id = b.site_id AND b1.site_id = c1.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = c1.site_id AND c1.score > q1.score)
