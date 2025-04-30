--stack_templates_generated-b7cefcac-bb1e-41f7-b54e-708a3cb74dbf_dda73ade-eacc-312d-8a22-9c373c9ac036.sql
--{"gen": "combine", "time": 5.058453321456909, "template": "generated-b7cefcac-bb1e-41f7-b54e-708a3cb74dbf", "dataset": "stack_templates", "rows": 46151}
SELECT *
FROM badge AS b1,
so_user AS so_user,
account AS account,
question AS q1,
so_user AS u1,
tag_question AS tq1,
badge AS b2
WHERE (b1.name = 'Caucus' AND account.website_url <> '' AND b2.name = 'Reversal' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND account.id = so_user.account_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND so_user.account_id = u1.account_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = b2.user_id AND b1.site_id = b2.site_id AND b2.date > b1.date + '11 months'::interval)
