--stack_templates_generated-19171fd1-ea8a-458f-8c7b-fe7b83ac9e6c_3d311f07-899c-309d-9910-a2f711240b13.sql
--{"gen": "erase", "time": 0.666304349899292, "template": "generated-19171fd1-ea8a-458f-8c7b-fe7b83ac9e6c", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2,
question AS q1,
question AS q2,
tag AS t1
WHERE (account.website_url <> '' AND b1.name = 'Illuminator' AND s1.site_name = 'ebooks' AND t1.name = 'jackson' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND u1.site_id = q1.site_id AND q1.site_id = tq1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND t1.site_id = s1.site_id AND tq1.tag_id = t1.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
