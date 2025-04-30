--stack_templates_generated-8b404049-cca1-4038-97c4-1ba52772a40b_5b5d0ec1-75e1-337c-bc86-264d11b6c332.sql
--{"gen": "erase", "time": 4.461048603057861, "template": "generated-8b404049-cca1-4038-97c4-1ba52772a40b", "dataset": "stack_templates", "rows": 81144}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
account AS account,
so_user AS so_user
WHERE (s1.site_name = 'ethereum' AND account.website_url <> '' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = so_user.account_id AND account.id = u1.account_id AND so_user.account_id = u1.account_id)
