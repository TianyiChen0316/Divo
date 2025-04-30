--stack_templates_q7-043_baa8923c-b1d9-3af3-8f13-8d037a23547d.sql
--{"gen": "combine", "time": 2.3275771141052246, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
so_user AS u2,
tag_question AS tq1
WHERE (account.website_url <> '' AND b1.name = 'Constable' AND s1.site_name = 'civicrm' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND u2.account_id = account.id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id)
