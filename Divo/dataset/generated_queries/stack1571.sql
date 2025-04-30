--stack_templates_generated-aac7d7da-5c61-4484-b72f-0c05613b1d31_1b5eb693-acf4-3543-9a11-0ea4059d0e85.sql
--{"gen": "erase", "time": 0.18989276885986328, "template": "generated-aac7d7da-5c61-4484-b72f-0c05613b1d31", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
question AS q2,
so_user AS u2,
tag_question AS tq2,
site AS s
WHERE (s1.site_name = 'raspberrypi' AND t1.name = 'sql-server-2012' AND s.site_name IN ('askubuntu', 'math') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND s.site_id = a1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND s.site_id = s1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
