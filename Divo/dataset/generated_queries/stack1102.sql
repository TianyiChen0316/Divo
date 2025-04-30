--stack_templates_generated-62a57127-091e-4ebd-b663-e6a5cd2643b0_e351e8b9-7338-36f6-af83-f62408ba3772.sql
--{"gen": "combine", "time": 3.2907509803771973, "template": "generated-62a57127-091e-4ebd-b663-e6a5cd2643b0", "dataset": "stack_templates", "rows": 4677}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
so_user AS u1,
tag_question AS tq1,
account AS account
WHERE (b1.name = 'Sheriff' AND b2.name = 'Synonymizer' AND account.website_url <> '' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND so_user.account_id = u1.account_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = so_user.account_id AND account.id = u1.account_id AND b2.date > b1.date + '11 months'::interval)
