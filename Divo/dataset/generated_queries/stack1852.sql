--stack_templates_generated-ba439fed-1af7-4e19-bcdd-23835115c0a9_89462d0e-e499-31bc-9c45-cee942bf7850.sql
--{"gen": "erase", "time": 3.7937211990356445, "template": "generated-ba439fed-1af7-4e19-bcdd-23835115c0a9", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2
WHERE (account.website_url <> '' AND b1.name = 'API Evangelist' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = tq1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id)
