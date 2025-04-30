--stack_templates_generated-3d64ab89-6385-47fe-b55f-42f0c5b77bd1_ea2e3be1-0537-3975-8f69-545ac62e1727.sql
--{"gen": "combine", "time": 0.34004902839660645, "template": "generated-3d64ab89-6385-47fe-b55f-42f0c5b77bd1", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
question AS q2,
site AS s1,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
tag_question AS tq2,
badge AS b1,
badge AS b2,
so_user AS so_user,
tag AS t1,
site AS s
WHERE (s1.site_name = 'wordpress' AND b1.name = 'Documentation Pioneer' AND b2.name = 'Caucus' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s.site_name IN ('askubuntu', 'math') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND tq2.question_id = q2.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND t1.site_id = s.site_id AND s.site_id = b1.site_id AND s.site_id = b2.site_id AND s.site_id = so_user.site_id AND u2.account_id = so_user.account_id AND u1.account_id = so_user.account_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND a1.site_id = so_user.site_id AND a1.site_id = b2.site_id AND so_user.site_id = s1.site_id AND s1.site_id = b2.site_id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND b2.date > b1.date + '11 months'::interval)
