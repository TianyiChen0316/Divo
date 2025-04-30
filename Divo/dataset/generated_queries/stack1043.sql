--stack_templates_generated-8b404049-cca1-4038-97c4-1ba52772a40b_e44e8e7c-c810-3859-8f73-5fe3403b463c.sql
--{"gen": "erase", "time": 4.107942342758179, "template": "generated-8b404049-cca1-4038-97c4-1ba52772a40b", "dataset": "stack_templates", "rows": 29329}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
account AS account,
so_user AS so_user,
answer AS a1
WHERE (s1.site_name = 'gis' AND account.website_url <> '' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id)
