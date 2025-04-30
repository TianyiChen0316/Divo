--stack_templates_generated-de3a2f9c-021a-44d1-8eb8-b733462314ac_101ebf94-7c1e-3c2e-b90c-2f1343708e50.sql
--{"gen": "erase", "time": 2.640083074569702, "template": "generated-de3a2f9c-021a-44d1-8eb8-b733462314ac", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2,
question AS q1
WHERE (account.website_url <> '' AND s1.site_name = 'outdoors' AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND u1.site_id = q1.site_id AND q1.site_id = tq1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
