--stack_templates_generated-14cc2e3c-2812-4434-ab6c-5d95f852914c_faa4299f-f54b-3101-80dd-c5d7ebe05948.sql
--{"gen": "erase", "time": 3.152056932449341, "template": "generated-14cc2e3c-2812-4434-ab6c-5d95f852914c", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (account.website_url <> '' AND b1.name = 'Commentator' AND b2.name = 'Not a Robot' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND b1.user_id = b2.user_id AND so_user.account_id = u1.account_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND b1.site_id = b2.site_id AND b2.date > b1.date + '11 months'::interval)
