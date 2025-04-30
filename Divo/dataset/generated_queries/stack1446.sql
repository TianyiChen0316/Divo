--stack_templates_generated-713e9162-90da-460e-888c-34579dca33e7_1b5cab7f-8828-36d6-9842-c086a91c7ebe.sql
--{"gen": "erase", "time": 1.3434457778930664, "template": "generated-713e9162-90da-460e-888c-34579dca33e7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10000 AND q1.favorite_count <= 10000 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id)
