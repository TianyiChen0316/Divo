--stack_templates_generated-4bad659e-2d32-4a2b-9151-7246d443a7e6_ef036a01-56f1-3008-b257-17ef8c8c4a60.sql
--{"gen": "combine", "time": 0.8099343776702881, "template": "generated-4bad659e-2d32-4a2b-9151-7246d443a7e6", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
comment AS c1,
account AS acc,
answer AS a1,
badge AS b
WHERE (s1.site_name = 'diy' AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND a1.owner_user_id = u1.id AND acc.id = u1.account_id AND b.user_id = u1.id AND q1.id = a1.question_id AND account.id = acc.id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND u1.site_id = c1.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND a1.site_id = s1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND a1.site_id = c1.site_id AND s1.site_id = b.site_id AND s1.site_id = c1.site_id AND b.site_id = tq1.site_id AND b.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND tq1.question_id = a1.question_id AND c1.post_id = a1.question_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = a1.owner_user_id AND c1.score > q1.score)
