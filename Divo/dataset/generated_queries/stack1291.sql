--stack_templates_generated-363adb4b-7320-485b-9df1-77fbc8301561_bc21fe7c-396e-363a-9ad6-5cb35068f281.sql
--{"gen": "erase", "time": 3.565654993057251, "template": "generated-363adb4b-7320-485b-9df1-77fbc8301561", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q2,
site AS s1,
so_user AS u1,
so_user AS u2,
tag AS t2,
tag_question AS tq1,
badge AS b1,
so_user AS so_user
WHERE (s1.site_name = 'opendata' AND t2.name = '2013' AND b1.name = 'API Beta' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND account.id = u2.account_id AND account.id = so_user.account_id AND u2.account_id = so_user.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id)
