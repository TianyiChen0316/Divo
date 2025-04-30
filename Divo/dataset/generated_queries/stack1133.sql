--stack_templates_generated-2520cc10-5535-4b95-8999-2168a618916c_a4474a41-167f-3e1c-a51b-53b10f5904ad.sql
--{"gen": "erase", "time": 0.23532962799072266, "template": "generated-2520cc10-5535-4b95-8999-2168a618916c", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b2
WHERE (q1.favorite_count >= 0 AND q1.favorite_count <= 10 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b2.name = 'Documentation Beta' AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
