--stack_templates_generated-62a57127-091e-4ebd-b663-e6a5cd2643b0_115e866e-1950-3e2a-bf92-c6227beae9a8.sql
--{"gen": "erase", "time": 2.7162888050079346, "template": "generated-62a57127-091e-4ebd-b663-e6a5cd2643b0", "dataset": "stack_templates", "rows": 2953}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
so_user AS u1
WHERE (b1.name = 'Synonymizer' AND b2.name = 'Documentation Pioneer' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND so_user.account_id = u1.account_id AND b2.date > b1.date + '11 months'::interval)
