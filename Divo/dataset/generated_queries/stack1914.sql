--stack_templates_generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a_891484e8-bf1d-34c6-9917-3a7ae35a2c8c.sql
--{"gen": "erase", "time": 1.414949655532837, "template": "generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
so_user AS u2
WHERE (s1.site_name = 'stackoverflow' AND t1.name = 'regression' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
