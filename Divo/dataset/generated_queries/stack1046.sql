--stack_templates_q7-043_c05fdbb6-a44b-3d0d-bf8d-3c4fbfc7219c.sql
--{"gen": "combine", "time": 2.6098906993865967, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
so_user AS u2,
tag AS t2
WHERE (account.website_url <> '' AND s1.site_name = 'iot' AND t2.name = 'iphone' AND account.id = so_user.account_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t2.site_id = u2.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id)
