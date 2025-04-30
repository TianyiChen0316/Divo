--stack_templates_q7-043_694b816d-cc27-3ef1-aab4-cfabc2f05862.sql
--{"gen": "erase", "time": 1.674126386642456, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user
WHERE (account.website_url <> '' AND b1.name = 'Sheriff' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id)
