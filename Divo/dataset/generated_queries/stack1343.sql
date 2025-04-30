--stack_templates_generated-3d64ab89-6385-47fe-b55f-42f0c5b77bd1_a0f66931-36e2-38e9-aa1a-607cff609770.sql
--{"gen": "erase", "time": 2.051307439804077, "template": "generated-3d64ab89-6385-47fe-b55f-42f0c5b77bd1", "dataset": "stack_templates", "rows": 6338}
SELECT *
FROM answer AS a1,
question AS q1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1
WHERE (s1.site_name = 'philosophy' AND s2.site_name = 'mathoverflow' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND s2.site_id = u2.site_id)
