--stack_templates_generated-2520cc10-5535-4b95-8999-2168a618916c_03248768-701c-3e05-89f0-cc4c554658bd.sql
--{"gen": "combine", "time": 0.23879504203796387, "template": "generated-2520cc10-5535-4b95-8999-2168a618916c", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b2,
account AS account,
answer AS a1,
site AS s1,
question AS q2,
so_user AS u2,
tag AS t2
WHERE (q1.favorite_count <= 5000 AND q1.favorite_count <= 10000 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b2.name = 'Lifeboat' AND s1.site_name = 'math' AND t2.name = 'file-io' AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND t1.site_id = a1.site_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = a1.owner_user_id AND b2.site_id = a1.site_id AND b2.site_id = s1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
