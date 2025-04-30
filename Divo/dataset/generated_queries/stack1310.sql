--stack_templates_generated-de3a2f9c-021a-44d1-8eb8-b733462314ac_f1d56cde-eb90-3399-9a15-8345167debcd.sql
--{"gen": "erase", "time": 2.97784161567688, "template": "generated-de3a2f9c-021a-44d1-8eb8-b733462314ac", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2
WHERE (account.website_url <> '' AND b1.name = 'Legendary' AND s1.site_name = 'magento' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id)
