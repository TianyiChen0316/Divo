--stack_templates_generated-1dac4d0c-ac43-481d-a984-8c617e68e6a7_a1e8dc32-ac2e-3a84-a7d3-afa758316926.sql
--{"gen": "erase", "time": 1.4655396938323975, "template": "generated-1dac4d0c-ac43-481d-a984-8c617e68e6a7", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
site AS s1,
so_user AS u1,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'german' AND t2.name = 'parallel-processing' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND t2.site_id = u2.site_id)
