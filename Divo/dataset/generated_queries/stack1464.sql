--stack_templates_q7-043_a2125a0b-4e68-38d2-a287-d5cfb9157522.sql
--{"gen": "erase", "time": 1.1388111114501953, "template": "q7-043", "dataset": "stack_templates", "rows": 486}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Illuminator' AND b2.name = 'Nice Question' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
