--stack_templates_generated-adbdb662-1cfa-448d-902a-2554cc8a5855_db73b885-6694-3e4c-9e9f-4ce336211f8e.sql
--{"gen": "erase", "time": 1.2559876441955566, "template": "generated-adbdb662-1cfa-448d-902a-2554cc8a5855", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2
WHERE (account.website_url <> '' AND s1.site_name = 'tor' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id)
