--stack_templates_generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a_77f40812-15fd-3632-87ea-fdcc3bb05165.sql
--{"gen": "combine", "time": 0.3107163906097412, "template": "generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a", "dataset": "stack_templates", "rows": 1}
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
comment AS c1,
badge AS b1,
badge AS b2,
so_user AS so_user,
site AS s
WHERE (s1.site_name = 'civicrm' AND t1.name = 'http' AND b1.name = 'Documentation Beta' AND b2.name = 'Synonymizer' AND s.site_name IN ('askubuntu', 'math') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND t1.site_id = b1.site_id AND t1.site_id = b2.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND t1.site_id = s.site_id AND s.site_id = b1.site_id AND s.site_id = b2.site_id AND s.site_id = so_user.site_id AND so_user.account_id = u1.account_id AND tq1.question_id = c1.post_id AND t1.site_id = c1.site_id AND s.site_id = s1.site_id AND s.site_id = c1.site_id AND u1.site_id = c1.site_id AND b1.site_id = s1.site_id AND b1.site_id = c1.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = c1.site_id AND b2.site_id = s1.site_id AND b2.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND u2.account_id = so_user.account_id AND c1.post_id = a1.question_id AND s.site_id = a1.site_id AND b1.site_id = a1.site_id AND a1.site_id = so_user.site_id AND a1.site_id = b2.site_id AND a1.site_id = c1.site_id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND a1.creation_date >= q1.creation_date + '1 year'::interval AND c1.score > q1.score AND b2.date > b1.date + '11 months'::interval)
