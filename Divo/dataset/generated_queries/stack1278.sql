--stack_templates_generated-2bd5ed56-0a0e-40a0-8139-74a03924eb6d_811e2323-89c9-3037-b887-15a0f9edd2a4.sql
--{"gen": "combine", "time": 1.752436637878418, "template": "generated-2bd5ed56-0a0e-40a0-8139-74a03924eb6d", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
site AS s1,
so_user AS u1,
tag_question AS tq1,
tag AS t,
tag_question AS tq,
badge AS b1,
so_user AS so_user,
answer AS a1,
question AS q1,
tag AS t1
WHERE (s1.site_name = 'beer' AND t.name IN ('tables', 'tikz-pgf') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count >= 0 AND q1.favorite_count <= 10 AND tq1.site_id = s1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND tq.site_id = so_user.site_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND t.site_id = so_user.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND so_user.site_id = a1.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = tq1.site_id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.id = a1.question_id AND tq.site_id = t1.site_id AND tq.site_id = q1.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = t.site_id AND t1.site_id = so_user.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND u1.site_id = q1.site_id AND b1.site_id = q1.site_id AND q1.site_id = t.site_id AND q1.site_id = so_user.site_id AND q1.site_id = a1.site_id AND q1.site_id = s1.site_id)
