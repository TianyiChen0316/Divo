--stack_templates_generated-1d750f00-261c-4da9-a19c-768734036faf_3b33d15c-40e3-3fa1-9d63-f8f0f1104ef4.sql
--{"gen": "combine", "time": 0.11529684066772461, "template": "generated-1d750f00-261c-4da9-a19c-768734036faf", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
badge AS b2,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
badge AS b
WHERE (t.name IN ('tables', 'tikz-pgf') AND b2.name = 'Not a Robot' AND q1.favorite_count >= 0 AND q1.favorite_count <= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND t1.site_id = a1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND t1.site_id = t.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = a1.site_id AND t.site_id = b2.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id)
