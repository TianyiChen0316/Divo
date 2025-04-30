--stack_templates_q7-043_94af08cd-7a42-3293-a66d-33248e93f6d8.sql
--{"gen": "erase", "time": 1.6471588611602783, "template": "q7-043", "dataset": "stack_templates", "rows": 1577}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Constable' AND b2.name = 'Famous Question' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
