--stack_templates_generated-ba439fed-1af7-4e19-bcdd-23835115c0a9_9d1056b3-4f5a-351c-8445-11ee2a4e10ba.sql
--{"gen": "erase", "time": 1.381737232208252, "template": "generated-ba439fed-1af7-4e19-bcdd-23835115c0a9", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2
WHERE (account.website_url <> '' AND s1.site_name = 'datascience' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id)
