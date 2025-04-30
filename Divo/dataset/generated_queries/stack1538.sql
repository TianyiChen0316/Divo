--stack_templates_q1-097_14567760-ad24-3a79-a7a6-84244d75a079.sql
--{"gen": "combine", "time": 0.10564422607421875, "template": "q1-097", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag_question AS tag_question,
question AS q1,
site AS s,
tag AS t1,
comment AS c1,
comment AS c2,
post_link AS pl,
tag_question AS tq2
WHERE (q1.favorite_count <= 5000 AND q1.favorite_count >= 1 AND s.site_name = 'ru' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tq2.tag_id = tag_question.tag_id AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = c1.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = pl.site_id AND c2.site_id = c1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = c1.site_id AND pl.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND tq2.tag_id = t1.id AND tag_question.tag_id = t1.id AND tq2.site_id = t1.site_id AND tq2.site_id = s.site_id AND c2.site_id = t1.site_id AND c2.site_id = s.site_id AND t1.site_id = tag_question.site_id AND t1.site_id = q1.site_id AND t1.site_id = pl.site_id AND t1.site_id = c1.site_id AND s.site_id = tag_question.site_id AND s.site_id = pl.site_id AND s.site_id = c1.site_id AND c1.date < c2.date)
