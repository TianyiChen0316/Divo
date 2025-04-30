--stack_templates_generated-4bad659e-2d32-4a2b-9151-7246d443a7e6_f1bc7db6-f6f4-34f2-9754-4a054f3b7e3d.sql
--{"gen": "combine", "time": 2.5415022373199463, "template": "generated-4bad659e-2d32-4a2b-9151-7246d443a7e6", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (s1.site_name = 'diy' AND b1.name = 'Illuminator' AND b2.name = 'Caucus' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = b2.user_id AND so_user.account_id = u1.account_id AND b1.site_id = b2.site_id AND b2.date > b1.date + '11 months'::interval)
