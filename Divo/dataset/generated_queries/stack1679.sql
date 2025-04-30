--stack_templates_generated-808817a3-89e3-41bd-87dd-ad323835d84b_b9ddde01-fabb-3707-a29f-ad346e1e57a8.sql
--{"gen": "erase", "time": 1.3642892837524414, "template": "generated-808817a3-89e3-41bd-87dd-ad323835d84b", "dataset": "stack_templates", "rows": 104}
SELECT *
FROM answer AS a1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1
WHERE (s1.site_name = 'quant' AND s2.site_name = 'iot' AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND s2.site_id = u2.site_id)
