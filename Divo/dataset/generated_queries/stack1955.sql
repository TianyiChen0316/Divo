--stack_templates_q3-075_512f3860-a25a-3632-ae33-d1cf91923a33.sql
--{"gen": "erase", "time": 1.2984542846679688, "template": "q3-075", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag AS t2,
tag_question AS tq1
WHERE (s1.site_name = 'buddhism' AND s2.site_name = 'cstheory' AND t2.name = 'opencv' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND t2.site_id = s2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND t2.site_id = u2.site_id)
