--stack_templates_generated-2e60b383-340a-4d21-80d0-6a8ceef992bd_2ac4b921-fcaa-3289-937a-c6cea8c0e577.sql
--{"gen": "combine", "time": 3.852689504623413, "template": "generated-2e60b383-340a-4d21-80d0-6a8ceef992bd", "dataset": "stack_templates", "rows": 70558}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
account AS account,
so_user AS so_user,
answer AS a1,
so_user AS u2
WHERE (s1.site_name = 'tor' AND account.website_url <> '' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id)
