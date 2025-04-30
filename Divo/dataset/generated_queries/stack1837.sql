--stack_templates_generated-76e02d2f-993f-4705-a520-a98a2612dbeb_63c92506-d33d-3ae8-a7dc-8f33c9c90380.sql
--{"gen": "combine", "time": 0.4448847770690918, "template": "generated-76e02d2f-993f-4705-a520-a98a2612dbeb", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
site AS s,
tag AS t,
tag_question AS tq,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b1
WHERE (q.score >= 10 AND q.score > 10 AND s.site_name IN ('tex') AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 5 AND q1.favorite_count >= 5 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND q.site_id = s.site_id AND t.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = s.site_id AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = q.site_id AND q1.site_id = q.site_id AND tq1.site_id = q.site_id AND tq.site_id = t.site_id AND tq.site_id = q.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND t.site_id = q.site_id AND b1.user_id = u1.id AND tq.site_id = b1.site_id AND t1.site_id = b1.site_id AND u1.site_id = b1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND s.site_id = b1.site_id)
