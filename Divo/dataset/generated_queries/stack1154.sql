--stack_templates_q2-016_8e1f71fd-f350-3592-abe3-e17135bb53ac.sql
--{"gen": "erase", "time": 1.0702054500579834, "template": "q2-016", "dataset": "stack_templates", "rows": 2}
SELECT DISTINCT account.display_name
FROM account AS account,
question AS q1,
question AS q2,
site AS s2,
so_user AS u1,
so_user AS u2,
tag AS t1,
tag_question AS tq1,
tag_question AS tq2
WHERE (t1.name = 'colorize' AND s2.site_name = 'health' AND tq1.question_id = q1.id AND tq1.tag_id = t1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND q2.site_id = s2.site_id AND tq2.site_id = s2.site_id AND tq2.question_id = q2.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u1.site_id = t1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id)
