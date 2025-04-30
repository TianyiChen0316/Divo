--stack_templates_generated-14cc2e3c-2812-4434-ab6c-5d95f852914c_e2ecd2f1-34a4-3dc1-982e-c0136ef7c403.sql
--{"gen": "erase", "time": 2.5379652976989746, "template": "generated-14cc2e3c-2812-4434-ab6c-5d95f852914c", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (account.website_url <> '' AND s1.site_name = 'drupal' AND account.id = so_user.account_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
