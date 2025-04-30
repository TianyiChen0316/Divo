--stack_templates_generated-113772a5-40e3-449e-8e1b-ec22cfbe64e1_84d3221a-93f4-3aaf-94ba-d31a661be399.sql
--{"gen": "erase", "time": 5.572144269943237, "template": "generated-113772a5-40e3-449e-8e1b-ec22cfbe64e1", "dataset": "stack_templates", "rows": 116760}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
so_user AS so_user
WHERE (s1.site_name = 'bicycles' AND q1.site_id = s1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND so_user.account_id = u1.account_id)
