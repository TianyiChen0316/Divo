--stack_templates_generated-e32f9bda-7f96-461c-9d9b-5142ab0108d7_2c6f996b-bf25-3521-881c-8fc52f217428.sql
--{"gen": "erase", "time": 3.1350338459014893, "template": "generated-e32f9bda-7f96-461c-9d9b-5142ab0108d7", "dataset": "stack_templates", "rows": 71091}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
so_user AS u1
WHERE (b1.name = 'Caucus' AND b2.name = 'Lifeboat' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND so_user.account_id = u1.account_id AND b2.date > b1.date + '11 months'::interval)
