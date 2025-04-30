--stack_templates_q6-072_52388de7-c56a-30f4-9846-2dbcf34aba73.sql
--{"gen": "erase", "time": 1.4964838027954102, "template": "q6-072", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'electronics' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
