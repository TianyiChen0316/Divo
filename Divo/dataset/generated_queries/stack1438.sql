--stack_templates_generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af_85ae119b-35b9-3e9c-b00c-90f5b9ba4147.sql
--{"gen": "combine", "time": 1.6880574226379395, "template": "generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af", "dataset": "stack_templates", "rows": 276}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
account AS account
WHERE (b1.name = 'Constable' AND b2.name = 'Caucus' AND account.website_url <> '' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND account.id = so_user.account_id AND b2.date > b1.date + '11 months'::interval)
