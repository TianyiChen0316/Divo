--stack_templates_generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af_ea2e3be1-0537-3975-8f69-545ac62e1727.sql
--{"gen": "combine", "time": 1.6016392707824707, "template": "generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af", "dataset": "stack_templates", "rows": 38390}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (b1.name = 'Custodian' AND b2.name = 'Famous Question' AND q1.favorite_count <= 10000 AND q1.favorite_count >= 0 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.date > b1.date + '11 months'::interval)
