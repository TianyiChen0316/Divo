--stack_templates_generated-41e1ef9f-706b-4ef3-91a8-ce92c64133a2_69c1f11c-c8c8-3d5b-940c-5e84b307b653.sql
--{"gen": "combine", "time": 0.41818785667419434, "template": "generated-41e1ef9f-706b-4ef3-91a8-ce92c64133a2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM site AS s,
tag_question AS tq,
tag AS t,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (s.site_name IN ('tex') AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 5 AND q1.favorite_count >= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND tq.site_id = s.site_id AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = q1.site_id AND s.site_id = t.site_id AND s.site_id = tq1.site_id)
