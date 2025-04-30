--stack_templates_q7-043_d3b371e3-4878-3ed5-baad-a4795b36a7cf.sql
--{"gen": "erase", "time": 1.5959343910217285, "template": "q7-043", "dataset": "stack_templates", "rows": 215}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Famous Question' AND b2.name = 'Illuminator' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
