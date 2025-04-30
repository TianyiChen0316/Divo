--stack_templates_q7-043_5ec970c9-8ba7-30bb-914d-3808fdd138c6.sql
--{"gen": "combine", "time": 1.5461061000823975, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
badge AS b2,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (account.website_url <> '' AND b1.name = 'Famous Question' AND b2.name = 'Sheriff' AND s1.site_name = 'bicycles' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND b1.user_id = b2.user_id AND so_user.account_id = u1.account_id AND b1.site_id = b2.site_id AND b2.date > b1.date + '11 months'::interval)
