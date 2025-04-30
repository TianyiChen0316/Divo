--stack_templates_generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a_1d4f7222-0bfd-3e00-a51b-41a384d29dd2.sql
--{"gen": "combine", "time": 0.210066556930542, "template": "generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a", "dataset": "stack_templates", "rows": 1}
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
tag AS t2,
tag_question AS tq2,
account AS acc,
badge AS b1,
site AS s
WHERE (s1.site_name = 'computergraphics' AND t1.name = 'memory-management' AND t2.name = 'appgyver' AND acc.website_url ILIKE '%org' AND s.site_name = 'rpg' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND acc.id = u1.account_id AND b1.user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND account.id = acc.id AND b1.user_id = a1.owner_user_id AND t1.site_id = b1.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND u1.site_id = b1.site_id AND b1.site_id = q1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND b1.site_id = tq1.site_id AND u2.account_id = acc.id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
