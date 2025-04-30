--stack_templates_generated-a4d2ddf2-ae4e-4e79-9276-0019a342eb0e_27fa8ed5-d34f-3c02-a17e-c2e10ff2acec.sql
--{"gen": "erase", "time": 4.816104173660278, "template": "generated-a4d2ddf2-ae4e-4e79-9276-0019a342eb0e", "dataset": "stack_templates", "rows": 135824}
SELECT *
FROM so_user AS so_user,
account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (account.website_url <> '' AND s1.site_name = 'outdoors' AND account.id = so_user.account_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
