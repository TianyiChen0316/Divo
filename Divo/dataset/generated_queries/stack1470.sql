--stack_templates_generated-b01c22a0-3fb7-440d-8f72-1b887980fb9a_ffe92da0-daa4-324b-866e-b87701007747.sql
--{"gen": "erase", "time": 0.386366605758667, "template": "generated-b01c22a0-3fb7-440d-8f72-1b887980fb9a", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
badge AS b
WHERE (q1.favorite_count >= 1 AND q1.favorite_count <= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND t1.site_id = a1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = b1.user_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = b1.user_id AND b1.user_id = a1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = a1.site_id AND b1.site_id = b.site_id AND b1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
