--stack_templates_generated-8b404049-cca1-4038-97c4-1ba52772a40b_585b188b-839c-32fb-86fa-b74864b8ea31.sql
--{"gen": "erase", "time": 1.5933852195739746, "template": "generated-8b404049-cca1-4038-97c4-1ba52772a40b", "dataset": "stack_templates", "rows": 32}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
account AS account,
answer AS a1,
so_user AS u2
WHERE (s1.site_name = 'esperanto' AND account.website_url <> '' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id)
