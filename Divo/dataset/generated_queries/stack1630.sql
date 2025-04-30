--stack_templates_generated-b3a059d6-ad3e-46ee-a136-ce7f2ba016a2_34e3c72e-5da1-3135-9e37-bc30a8ec0dfb.sql
--{"gen": "erase", "time": 3.0109059810638428, "template": "generated-b3a059d6-ad3e-46ee-a136-ce7f2ba016a2", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1,
so_user AS u1,
question AS q1
WHERE (account.website_url <> '' AND b1.name = 'API Beta' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND so_user.account_id = u1.account_id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND u1.site_id = q1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
