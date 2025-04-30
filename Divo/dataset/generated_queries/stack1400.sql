--stack_templates_q7-043_e17853dc-4b26-397a-83ea-a1d1dd4691cf.sql
--{"gen": "erase", "time": 1.5963220596313477, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user
WHERE (account.website_url <> '' AND b1.name = 'API Beta' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id)
