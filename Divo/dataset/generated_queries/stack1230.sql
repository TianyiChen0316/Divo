--stack_templates_generated-113772a5-40e3-449e-8e1b-ec22cfbe64e1_556b84d0-db04-38c1-987a-a0e24a38681b.sql
--{"gen": "combine", "time": 2.7527596950531006, "template": "generated-113772a5-40e3-449e-8e1b-ec22cfbe64e1", "dataset": "stack_templates", "rows": 7640}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
account AS account,
so_user AS so_user,
account AS acc,
answer AS a1,
badge AS b,
tag_question AS tq1
WHERE (s1.site_name = 'chemistry' AND account.website_url <> '' AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.site_id = s1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND account.id = so_user.account_id AND account.id = u1.account_id AND so_user.account_id = u1.account_id AND a1.owner_user_id = u1.id AND acc.id = u1.account_id AND b.user_id = u1.id AND q1.id = a1.question_id AND q1.id = tq1.question_id AND account.id = acc.id AND so_user.account_id = acc.id AND tq1.question_id = a1.question_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = a1.owner_user_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND s1.site_id = b.site_id AND s1.site_id = tq1.site_id AND b.site_id = tq1.site_id)
