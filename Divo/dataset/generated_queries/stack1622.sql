--stack_templates_q7-043_94ea1ddf-36ea-319c-855e-fd2007c11359.sql
--{"gen": "erase", "time": 1.6428461074829102, "template": "q7-043", "dataset": "stack_templates", "rows": 602}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Sheriff' AND b2.name = 'Caucus' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
