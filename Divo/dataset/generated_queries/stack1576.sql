--stack_templates_generated-967973ce-8bef-4b3e-bcaa-b8e413693f2b_6c82addf-2cf9-39f8-b751-85ab90d0fd9f.sql
--{"gen": "combine", "time": 0.9717881679534912, "template": "generated-967973ce-8bef-4b3e-bcaa-b8e413693f2b", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag_question AS tq1,
account AS account,
site AS s1,
site AS s,
tag AS t1
WHERE (q.score > 11 AND q.score >= 0 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10000 AND q1.favorite_count >= 5 AND account.website_url <> '' AND s1.site_name = 'electronics' AND s.site_name IN ('tex') AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND tq.site_id = s1.site_id AND b1.site_id = s1.site_id AND t.site_id = s1.site_id AND s1.site_id = q.site_id AND q.site_id = s.site_id AND t.site_id = s.site_id AND tq.site_id = s.site_id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND t1.site_id = b1.site_id AND t1.site_id = s1.site_id AND s.site_id = b1.site_id AND s.site_id = s1.site_id)
