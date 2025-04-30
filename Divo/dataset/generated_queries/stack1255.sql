--stack_templates_q7-043_43ddfad2-e76c-3cc1-b72d-0068de897ac1.sql
--{"gen": "erase", "time": 1.6649425029754639, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user
WHERE (account.website_url <> '' AND b1.name = 'Publicist' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id)
