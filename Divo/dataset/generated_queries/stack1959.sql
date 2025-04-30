--stack_templates_q3-075_7bb7772b-8abd-3327-9109-ffca65f1f1d6.sql
--{"gen": "combine", "time": 0.3072695732116699, "template": "q3-075", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag AS t1,
tag AS t2,
tag_question AS tq1,
tag_question AS tq2,
badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (s1.site_name = 'tor' AND s2.site_name = 'security' AND t1.name = 'ag.algebraic-geometry' AND t2.name = 'microsoft-edge' AND b1.name = 'Reversal' AND b2.name = 'API Beta' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = s2.site_id AND q2.site_id = u2.site_id AND t1.site_id = s1.site_id AND t2.site_id = s2.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND tq2.question_id = q2.id AND tq2.site_id = s2.site_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND t1.site_id = b1.site_id AND t1.site_id = b2.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND account.id = u2.account_id AND u2.account_id = so_user.account_id AND u1.account_id = so_user.account_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND s2.site_id = u2.site_id AND tq1.question_id = a1.question_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = so_user.site_id AND a1.site_id = s1.site_id AND a1.site_id = b2.site_id AND a1.site_id = tq1.site_id AND so_user.site_id = s1.site_id AND s1.site_id = b2.site_id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND b2.date > b1.date + '11 months'::interval)
