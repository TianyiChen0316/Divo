--stack_templates_generated-20b81c49-97ae-40f2-a4f7-ba0f103011f7_cd2591a2-5450-3d23-a4d4-4366bcb7e5ff.sql
--{"gen": "erase", "time": 2.312838554382324, "template": "generated-20b81c49-97ae-40f2-a4f7-ba0f103011f7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag_question AS tq,
tag AS t,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
question AS q2,
so_user AS u2
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 5000 AND q1.favorite_count <= 5000 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u2.account_id = account.id)
