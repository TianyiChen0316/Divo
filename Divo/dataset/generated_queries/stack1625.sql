--stack_templates_generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a_f3f662f6-b70b-347a-90d7-a63c7a3ea152.sql
--{"gen": "combine", "time": 0.23883605003356934, "template": "generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a", "dataset": "stack_templates", "rows": 1}
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
badge AS b,
site AS s
WHERE (s1.site_name = 'lifehacks' AND t1.name = '12.04' AND t2.name = 'match-phrase' AND s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = b.site_id AND b.user_id = u1.id AND acc.id = u1.account_id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND account.id = acc.id AND u2.account_id = acc.id AND b.user_id = a1.owner_user_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND a1.site_id = b.site_id AND s1.site_id = b.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
