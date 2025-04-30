--stack_templates_generated-3fd358f7-6963-4849-8fc4-da4cd2b8d665_63c92506-d33d-3ae8-a7dc-8f33c9c90380.sql
--{"gen": "erase", "time": 5.759609222412109, "template": "generated-3fd358f7-6963-4849-8fc4-da4cd2b8d665", "dataset": "stack_templates", "rows": 758475}
SELECT *
FROM site AS s1,
so_user AS u1,
so_user AS u2
WHERE (s1.site_name = 'datascience' AND u1.account_id = u2.account_id AND u1.site_id = s1.site_id)
