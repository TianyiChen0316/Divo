--stack_templates_generated-363adb4b-7320-485b-9df1-77fbc8301561_f155d705-13a8-3c46-bc08-3599e17727e2.sql
--{"gen": "erase", "time": 0.538536548614502, "template": "generated-363adb4b-7320-485b-9df1-77fbc8301561", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag AS t1,
tag_question AS tq1,
badge AS b1,
so_user AS so_user
WHERE (s1.site_name = 'philosophy' AND s2.site_name = 'math' AND t1.name = 'burn-in' AND b1.name = 'Reversal' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND u1.account_id = u2.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND account.id = u2.account_id AND account.id = so_user.account_id AND u2.account_id = so_user.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND s2.site_id = u2.site_id)
