--stack_templates_generated-c7a5cd85-b674-41e0-bb36-115991774e40_40842954-2339-3334-8233-dcc170ad64b8.sql
--{"gen": "combine", "time": 0.5361659526824951, "template": "generated-c7a5cd85-b674-41e0-bb36-115991774e40", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b2,
answer AS a1,
site AS s1,
so_user AS u2,
tag_question AS tq2
WHERE (q1.favorite_count <= 10000 AND q1.favorite_count <= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b2.name = 'Sheriff' AND s1.site_name = 'cstheory' AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND t1.site_id = s1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND s1.site_id = a1.site_id AND t1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND tq2.site_id = u2.site_id AND a1.owner_user_id = q1.owner_user_id AND a1.owner_user_id = b2.user_id AND b2.site_id = a1.site_id AND b2.site_id = s1.site_id)
