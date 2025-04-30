--stack_templates_generated-4bad659e-2d32-4a2b-9151-7246d443a7e6_1f49b736-558b-38c4-9fc3-2cc2ab9c86bd.sql
--{"gen": "combine", "time": 1.5376770496368408, "template": "generated-4bad659e-2d32-4a2b-9151-7246d443a7e6", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
question AS q2,
site AS s2,
so_user AS u2
WHERE (s1.site_name = 'drupal' AND s2.site_name = 'health' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.site_id = s2.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND s2.site_id = u2.site_id AND account.id = u2.account_id AND q1.owner_user_id = a1.owner_user_id)
