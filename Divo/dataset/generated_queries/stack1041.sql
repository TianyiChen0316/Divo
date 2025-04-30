--stack_templates_q7-043_83e4f9bc-9c39-3c14-a72a-acfb18eced5c.sql
--{"gen": "combine", "time": 1.510209083557129, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
so_user AS u2,
tag_question AS tq1
WHERE (account.website_url <> '' AND b1.name = 'API Evangelist' AND s1.site_name = 'woodworking' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id)
