--stack_templates_q7-043_b16302f6-9f66-3dd8-8f52-6952ca9703d3.sql
--{"gen": "combine", "time": 2.998624801635742, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
answer AS a1,
question AS q2,
site AS s1,
so_user AS u1,
so_user AS u2,
tag_question AS tq1
WHERE (account.website_url <> '' AND s1.site_name = 'freelancing' AND account.id = so_user.account_id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND u2.account_id = account.id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id)
