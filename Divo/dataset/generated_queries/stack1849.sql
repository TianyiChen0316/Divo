--stack_templates_q7-043_e99af881-2858-36b2-ba43-a85c852a9383.sql
--{"gen": "erase", "time": 1.607771873474121, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user
WHERE (account.website_url <> '' AND b1.name = 'Documentation Pioneer' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id)
