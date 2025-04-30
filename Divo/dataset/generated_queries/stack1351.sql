--stack_templates_q3-075_83354f72-7376-3b23-a56e-21969b08d5aa.sql
--{"gen": "erase", "time": 1.238391637802124, "template": "q3-075", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
tag_question AS tq2
WHERE (s1.site_name = 'tor' AND s2.site_name = 'linguistics' AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.site_id = s2.site_id AND tq2.site_id = s2.site_id AND tq2.question_id = q2.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id)
