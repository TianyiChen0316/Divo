--stack_templates_generated-fbb1709c-85fc-43fa-9e0a-65ee4b10a322_00449de2-2d8a-326e-859f-33995c44be4e.sql
--{"gen": "erase", "time": 5.916792392730713, "template": "generated-fbb1709c-85fc-43fa-9e0a-65ee4b10a322", "dataset": "stack_templates", "rows": 120595}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
so_user AS u1
WHERE (b1.name = 'Famous Question' AND b2.name = 'Not a Robot' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND so_user.account_id = u1.account_id AND b2.date > b1.date + '11 months'::interval)
