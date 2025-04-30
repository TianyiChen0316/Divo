--stack_templates_generated-63f3b21b-e125-48ef-9e1c-af7feaf27b43_ca44f269-d9d7-3e06-ab82-e2950d858e56.sql
--{"gen": "erase", "time": 0.25053906440734863, "template": "generated-63f3b21b-e125-48ef-9e1c-af7feaf27b43", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b2
WHERE (acc.website_url ILIKE '%me' AND q1.favorite_count <= 10000 AND q1.favorite_count <= 5000 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b2.name = 'Reversal' AND acc.id = u1.account_id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
