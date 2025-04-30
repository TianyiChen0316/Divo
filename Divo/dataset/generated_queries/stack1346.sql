--stack_templates_generated-3d64ab89-6385-47fe-b55f-42f0c5b77bd1_43b80880-4097-305a-b6e4-e52ff62fe0fa.sql
--{"gen": "combine", "time": 0.23462462425231934, "template": "generated-3d64ab89-6385-47fe-b55f-42f0c5b77bd1", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
tag_question AS tq2,
tag AS t1,
tag AS t2
WHERE (s1.site_name = 'woodworking' AND s2.site_name = 'stackoverflow' AND t1.name = 'matrix' AND t2.name = 'sharia' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.site_id = s2.site_id AND tq2.site_id = s2.site_id AND tq2.question_id = q2.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t1.site_id = s1.site_id AND t2.site_id = s2.site_id AND tq1.tag_id = t1.id AND tq2.tag_id = t2.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND tq2.site_id = t2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id)
