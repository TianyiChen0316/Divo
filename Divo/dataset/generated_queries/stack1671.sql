--stack_templates_generated-a8fe5deb-8d12-4411-a954-4849d6325e39_1b8ee0a1-235d-328c-959a-36d6e481027b.sql
--{"gen": "erase", "time": 0.2810230255126953, "template": "generated-a8fe5deb-8d12-4411-a954-4849d6325e39", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
site AS s
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 1 AND q1.favorite_count >= 5 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s.site_name IN ('askubuntu', 'math') AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND tq.site_id = a1.site_id AND t1.site_id = a1.site_id AND u1.site_id = a1.site_id AND q1.site_id = a1.site_id AND t.site_id = a1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND tq.site_id = s.site_id AND s.site_id = t.site_id AND s.site_id = a1.site_id AND a1.owner_user_id = b1.user_id AND s.site_id = b1.site_id AND b1.site_id = a1.site_id)
