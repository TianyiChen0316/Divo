--stack_templates_q7-043_3684bba4-c817-3a7b-84da-3e0eb1e9e2cd.sql
--{"gen": "erase", "time": 1.5768945217132568, "template": "q7-043", "dataset": "stack_templates", "rows": 1}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Documentation Beta' AND b2.name = 'Illuminator' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
