--stack_templates_generated-207f29cc-f992-402f-bb0d-0f98bb4c73da_4aa8fbbe-3a59-3fac-9948-34eddf4fef21.sql
--{"gen": "erase", "time": 1.5498428344726562, "template": "generated-207f29cc-f992-402f-bb0d-0f98bb4c73da", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
badge AS b2,
so_user AS so_user,
so_user AS u1,
tag_question AS tq1
WHERE (account.website_url <> '' AND b1.name = 'Legendary' AND b2.name = 'API Evangelist' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = u1.id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
