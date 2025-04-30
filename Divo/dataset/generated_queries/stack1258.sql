--stack_templates_q7-043_6bbc2be4-f01e-38e0-a927-72fc1954d651.sql
--{"gen": "combine", "time": 1.4347219467163086, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1
WHERE (account.website_url <> '' AND b1.name = 'Synonymizer' AND s1.site_name = 'german' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id)
