--stack_templates_generated-b866aea3-5b5f-43bf-8fa0-1c93e12a380c_18295a36-ea92-39ed-84f0-9523da33c776.sql
--{"gen": "erase", "time": 2.811112403869629, "template": "generated-b866aea3-5b5f-43bf-8fa0-1c93e12a380c", "dataset": "stack_templates", "rows": 63}
SELECT DISTINCT account.display_name
FROM account AS account,
question AS q1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag AS t1,
tag_question AS tq1,
tag_question AS tq2
WHERE (t1.name = 'wireless-networking' AND s2.site_name = 'pt' AND tq1.question_id = q1.id AND tq1.tag_id = t1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq2.site_id = s2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u1.site_id = t1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND tq2.site_id = u2.site_id)
