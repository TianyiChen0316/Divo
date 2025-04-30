--stack_templates_generated-ee79923e-8e9c-4cdc-ad22-4c54ffbb3eae_d84d6303-4b6b-371b-a00d-c91f5df240a1.sql
--{"gen": "erase", "time": 5.0295679569244385, "template": "generated-ee79923e-8e9c-4cdc-ad22-4c54ffbb3eae", "dataset": "stack_templates", "rows": 285886}
SELECT *
FROM site AS s1,
so_user AS u1,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'stats' AND t2.name = 'scope' AND u1.account_id = u2.account_id AND u1.site_id = s1.site_id AND t2.site_id = u2.site_id)
