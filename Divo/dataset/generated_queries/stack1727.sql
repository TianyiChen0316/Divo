--stack_templates_q7-043_ee9f5a9a-4b5a-33cb-9553-22aa8a2f301e.sql
--{"gen": "erase", "time": 1.4668269157409668, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user
WHERE (account.website_url <> '' AND b1.name = 'Research Assistant' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id)
