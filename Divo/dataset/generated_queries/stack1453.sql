--stack_templates_generated-90ad361c-7586-420a-bd93-32fdb56ce234_4aa8fbbe-3a59-3fac-9948-34eddf4fef21.sql
--{"gen": "erase", "time": 0.15513324737548828, "template": "generated-90ad361c-7586-420a-bd93-32fdb56ce234", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b2,
comment AS c1,
site AS s1
WHERE (acc.website_url ILIKE '%com' AND q1.favorite_count <= 1 AND q1.favorite_count <= 5000 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b2.name = 'Commentator' AND s1.site_name = 'cooking' AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c1.post_id = tq1.question_id AND c1.site_id = u1.site_id AND c1.site_id = s1.site_id AND c1.site_id = tq1.site_id AND u1.site_id = s1.site_id AND t1.site_id = s1.site_id AND t1.site_id = c1.site_id AND b1.site_id = s1.site_id AND b1.site_id = c1.site_id AND b2.site_id = s1.site_id AND b2.site_id = c1.site_id AND b2.date > b1.date + '11 months'::interval AND c1.score > q1.score)
