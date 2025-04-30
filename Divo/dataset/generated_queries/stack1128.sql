--stack_templates_q7-043_8685c534-acb9-30ee-974a-599220f07ad6.sql
--{"gen": "erase", "time": 1.572197437286377, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user
WHERE (account.website_url <> '' AND b1.name = 'Documentation Beta' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id)
