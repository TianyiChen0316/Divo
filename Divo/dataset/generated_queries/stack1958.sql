--stack_templates_generated-36d799a7-6aba-4596-afb0-c584e69753e1_f7db6d77-9d49-3864-9fb1-4b3fbe9560ee.sql
--{"gen": "erase", "time": 2.5573201179504395, "template": "generated-36d799a7-6aba-4596-afb0-c584e69753e1", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (account.website_url <> '' AND s1.site_name = 'codereview' AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id)
