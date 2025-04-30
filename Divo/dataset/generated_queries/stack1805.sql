--stack_templates_generated-5d562e12-87d3-4ce2-9bcf-d98c7ce9f1d1_d2eeef8a-8075-302c-80bc-9838b001ee7a.sql
--{"gen": "combine", "time": 0.27286434173583984, "template": "generated-5d562e12-87d3-4ce2-9bcf-d98c7ce9f1d1", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
question AS q,
tag_question AS tq,
badge AS b1,
tag AS t1
WHERE (t.name IN ('tables', 'tikz-pgf') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.score > 7 AND q1.score >= 10 AND u1.reputation >= 0 AND u1.reputation <= 100 AND q.score > 7 AND q.score <= 5 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b.user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND b.site_id = tq1.site_id AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = q.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND q1.site_id = q.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND b1.user_id = b.user_id AND u1.id = q1.owner_user_id AND b.user_id = q1.owner_user_id AND tq.site_id = b.site_id AND t1.site_id = b.site_id AND b1.site_id = b.site_id AND b.site_id = q.site_id)
