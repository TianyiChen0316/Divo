--stack_templates_generated-c7a5cd85-b674-41e0-bb36-115991774e40_94af08cd-7a42-3293-a66d-33248e93f6d8.sql
--{"gen": "combine", "time": 0.13991856575012207, "template": "generated-c7a5cd85-b674-41e0-bb36-115991774e40", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b2,
account AS account,
badge AS b1,
answer AS a1,
site AS s1
WHERE (q1.favorite_count <= 10 AND q1.favorite_count <= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b2.name = 'Synonymizer' AND account.website_url <> '' AND b1.name = 'Nice Question' AND s1.site_name = 'bicycles' AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND q1.site_id = s1.site_id AND t1.site_id = b1.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND u1.site_id = b1.site_id AND b1.site_id = q1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND b1.site_id = tq1.site_id AND a1.owner_user_id = q1.owner_user_id AND a1.owner_user_id = b2.user_id AND b1.site_id = b2.site_id AND b2.site_id = a1.site_id AND b2.site_id = s1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
