--stack_templates_q7-043_bd213bf0-0991-38c6-b3b7-5409055f44a6.sql
--{"gen": "erase", "time": 1.6033308506011963, "template": "q7-043", "dataset": "stack_templates", "rows": 4}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'API Beta' AND b2.name = 'Custodian' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
