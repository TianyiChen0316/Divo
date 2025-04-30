--stack_templates_generated-19171fd1-ea8a-458f-8c7b-fe7b83ac9e6c_43ddfad2-e76c-3cc1-b72d-0068de897ac1.sql
--{"gen": "erase", "time": 3.7980518341064453, "template": "generated-19171fd1-ea8a-458f-8c7b-fe7b83ac9e6c", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2,
question AS q2,
tag AS t2
WHERE (account.website_url <> '' AND s1.site_name = 'codereview' AND t2.name = 'story-identification' AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id)
