--stack_templates_generated-ba439fed-1af7-4e19-bcdd-23835115c0a9_d05ef620-06ba-36e6-9ab1-1b9b7a46c6e3.sql
--{"gen": "erase", "time": 2.61517596244812, "template": "generated-ba439fed-1af7-4e19-bcdd-23835115c0a9", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (account.website_url <> '' AND s1.site_name = 'electronics' AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id)
