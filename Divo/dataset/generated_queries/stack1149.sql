--stack_templates_q2-016_5b5d0ec1-75e1-337c-bc86-264d11b6c332.sql
--{"gen": "erase", "time": 2.9362306594848633, "template": "q2-016", "dataset": "stack_templates", "rows": 8456}
SELECT DISTINCT account.display_name
FROM account AS account,
question AS q1,
question AS q2,
so_user AS u1,
so_user AS u2,
tag AS t1,
tag AS t2,
tag_question AS tq1
WHERE (t1.name = 'apt' AND t2.name = 'sed' AND tq1.question_id = q1.id AND tq1.tag_id = t1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u1.site_id = t1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id)
