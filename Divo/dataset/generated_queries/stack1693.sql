--stack_templates_generated-8b404049-cca1-4038-97c4-1ba52772a40b_ef68c6b3-4265-32e9-aec3-23d879620c46.sql
--{"gen": "combine", "time": 5.198221206665039, "template": "generated-8b404049-cca1-4038-97c4-1ba52772a40b", "dataset": "stack_templates", "rows": 15900}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
account AS account,
so_user AS so_user,
answer AS a1,
so_user AS u2,
badge AS b1,
badge AS b2
WHERE (s1.site_name = 'graphicdesign' AND account.website_url <> '' AND b1.name = 'Caucus' AND b2.name = 'Publicist' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
