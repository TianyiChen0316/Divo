--stack_templates_generated-f0c497b7-cfc5-4c7a-a418-2d12b6476571_79650433-d39d-3476-83f5-11611e639545.sql
--{"gen": "erase", "time": 3.548218011856079, "template": "generated-f0c497b7-cfc5-4c7a-a418-2d12b6476571", "dataset": "stack_templates", "rows": 22882}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
account AS account,
so_user AS so_user
WHERE (s1.site_name = 'lifehacks' AND account.website_url <> '' AND q1.site_id = s1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND account.id = so_user.account_id AND account.id = u1.account_id AND so_user.account_id = u1.account_id)
