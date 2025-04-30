--stack_templates_q7-043_b7f3569c-bdc5-31fa-8174-fc11b1c49ea6.sql
--{"gen": "combine", "time": 1.6596794128417969, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (account.website_url <> '' AND b1.name = 'Nice Question' AND b2.name = 'API Beta' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = b2.user_id AND b1.site_id = b2.site_id AND b2.date > b1.date + '11 months'::interval)
