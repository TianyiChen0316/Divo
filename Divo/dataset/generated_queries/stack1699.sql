--stack_templates_generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a_8da4911a-35a0-331c-97b1-96a4879f3a0f.sql
--{"gen": "combine", "time": 0.5300359725952148, "template": "generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a", "dataset": "stack_templates", "rows": 1}
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
tag AS t,
tag_question AS tq,
badge AS b1,
so_user AS so_user
WHERE (s1.site_name = 'askubuntu' AND t1.name = 'long-filenames' AND t2.name = 'windows-7' AND t.name IN ('tables', 'tikz-pgf') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND tq.site_id = so_user.site_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND t.site_id = so_user.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND so_user.site_id = a1.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = tq1.site_id AND u2.account_id = so_user.account_id AND tq.site_id = t1.site_id AND tq.site_id = q1.site_id AND t1.site_id = b1.site_id AND t1.site_id = t.site_id AND t1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND q1.site_id = t.site_id AND q1.site_id = so_user.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
