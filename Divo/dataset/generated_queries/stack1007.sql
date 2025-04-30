--stack_templates_generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af_83f77c0d-dd04-3bb7-90fc-5377089a2cca.sql
--{"gen": "combine", "time": 3.1326260566711426, "template": "generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af", "dataset": "stack_templates", "rows": 386}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
account AS account,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'Not a Robot' AND b2.name = 'Custodian' AND account.website_url <> '' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND account.id = so_user.account_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND so_user.account_id = u1.account_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND b2.date > b1.date + '11 months'::interval)
