--stack_templates_generated-63631a72-1b4c-4770-8bce-ba70697f1de4_e133452f-4f66-3c36-94a8-18d861a94426.sql
--{"gen": "combine", "time": 1.5710201263427734, "template": "generated-63631a72-1b4c-4770-8bce-ba70697f1de4", "dataset": "stack_templates", "rows": 2357}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
so_user AS u2
WHERE (s1.site_name = 'civicrm' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id)
