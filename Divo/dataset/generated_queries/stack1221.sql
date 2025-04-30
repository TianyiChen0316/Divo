--stack_templates_q7-043_c3922e8e-a8b1-3a7f-ab21-16d912bd64bf.sql
--{"gen": "erase", "time": 1.617722988128662, "template": "q7-043", "dataset": "stack_templates", "rows": 59}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Reversal' AND b2.name = 'Reversal' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
