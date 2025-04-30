--stack_templates_generated-92c06726-151b-4a52-82e3-4fc2d47c5c3e_e7a501f7-a6eb-3db8-8713-4fa502525489.sql
--{"gen": "combine", "time": 0.1413717269897461, "template": "generated-92c06726-151b-4a52-82e3-4fc2d47c5c3e", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
site AS s1,
question AS q2,
so_user AS u2,
tag AS t2
WHERE (q1.favorite_count <= 5000 AND q1.favorite_count >= 0 AND s.site_name = 'security' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s1.site_name = 'superuser' AND t2.name = 'general-relativity' AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND t1.site_id = a1.site_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND a1.owner_user_id = q1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
