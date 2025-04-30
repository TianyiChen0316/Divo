--stack_templates_generated-8d338d16-780c-403a-a615-297a097f0106_fb64f617-3df3-3c0a-8fc0-dc1ba8dd84ab.sql
--{"gen": "erase", "time": 1.746833324432373, "template": "generated-8d338d16-780c-403a-a615-297a097f0106", "dataset": "stack_templates", "rows": 2517}
SELECT DISTINCT account.display_name
FROM account AS account,
question AS q1,
so_user AS u1,
so_user AS u2,
tag AS t1,
tag AS t2,
tag_question AS tq1
WHERE (t1.name = 'swagger' AND t2.name = 'notifications' AND tq1.question_id = q1.id AND tq1.tag_id = t1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u1.site_id = t1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND t2.site_id = u2.site_id)
