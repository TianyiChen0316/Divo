--stack_templates_generated-4bad659e-2d32-4a2b-9151-7246d443a7e6_b1242253-2f70-3034-8f20-eb3fbe64f0e3.sql
--{"gen": "combine", "time": 2.1551694869995117, "template": "generated-4bad659e-2d32-4a2b-9151-7246d443a7e6", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS so_user
WHERE (s1.site_name = 'aviation' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND so_user.account_id = u1.account_id AND account.id = so_user.account_id)
