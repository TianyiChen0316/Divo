--stack_templates_generated-20b81c49-97ae-40f2-a4f7-ba0f103011f7_984bbd0e-6253-3f8a-9ee3-3e8b31caab38.sql
--{"gen": "erase", "time": 1.3624086380004883, "template": "generated-20b81c49-97ae-40f2-a4f7-ba0f103011f7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag_question AS tq,
tag AS t,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
so_user AS u2,
tag AS t2
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 5000 AND q1.favorite_count >= 0 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND t2.name = 'probability-theory' AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND u1.account_id = u2.account_id AND t2.site_id = u2.site_id)
