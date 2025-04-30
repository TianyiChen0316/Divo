--stack_templates_generated-98262b24-b055-42af-a2c0-50b9899903a3_746ad2a1-6f5b-3679-ad26-451cf2b79423.sql
--{"gen": "combine", "time": 0.3269803524017334, "template": "generated-98262b24-b055-42af-a2c0-50b9899903a3", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
site AS s,
account AS acc
WHERE (q.score >= 1 AND q.score > 8 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 1 AND q1.favorite_count >= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s.site_name IN ('tex') AND acc.website_url ILIKE '%en' AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND q.site_id = s.site_id AND t.site_id = s.site_id AND tq.site_id = s.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND acc.id = u1.account_id)
