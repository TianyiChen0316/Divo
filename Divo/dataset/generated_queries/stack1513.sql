--stack_templates_q7-043_52010df7-0ea4-3bb5-bde9-a85a8332850d.sql
--{"gen": "erase", "time": 1.4804911613464355, "template": "q7-043", "dataset": "stack_templates", "rows": 10}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Constable' AND b2.name = 'Epic' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
