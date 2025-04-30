--stack_templates_generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a_94f12c9f-9047-3854-bc18-2266b4c35cb0.sql
--{"gen": "erase", "time": 2.0775411128997803, "template": "generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'tex' AND t2.name = 'windows-7' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t2.site_id = u2.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
