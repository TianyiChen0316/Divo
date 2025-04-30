--stack_templates_generated-98262b24-b055-42af-a2c0-50b9899903a3_e1c57995-a0f5-3bf3-8c01-e7836ba6d279.sql
--{"gen": "erase", "time": 0.10249876976013184, "template": "generated-98262b24-b055-42af-a2c0-50b9899903a3", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
site AS s
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10 AND q1.favorite_count <= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s.site_name IN ('tex') AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND t.site_id = s.site_id AND tq.site_id = s.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id)
