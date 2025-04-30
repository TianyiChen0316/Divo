--stack_templates_q7-043_28b2b6c8-cf1b-3bc9-9274-abd26f60f417.sql
--{"gen": "erase", "time": 1.6312360763549805, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user
WHERE (account.website_url <> '' AND b1.name = 'Constable' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id)
