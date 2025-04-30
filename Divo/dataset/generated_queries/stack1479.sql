--stack_templates_q4-075_14e01bc8-6591-3d19-b72d-ef97f3923af8.sql
--{"gen": "erase", "time": 0.10471081733703613, "template": "q4-075", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'raspberrypi' AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id)
