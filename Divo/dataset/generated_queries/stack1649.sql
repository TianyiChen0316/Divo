--stack_templates_q7-043_b09ff055-2f5f-33b7-a64b-4ce65cbebe12.sql
--{"gen": "erase", "time": 1.6028132438659668, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user
WHERE (account.website_url <> '' AND b1.name = 'API Evangelist' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id)
