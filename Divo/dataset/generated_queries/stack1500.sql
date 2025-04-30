--stack_templates_q7-043_406f29d2-5f29-37e3-8fe6-2b7a8e9389e9.sql
--{"gen": "erase", "time": 1.5754432678222656, "template": "q7-043", "dataset": "stack_templates", "rows": 363}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Famous Question' AND b2.name = 'Research Assistant' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
