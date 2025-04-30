--stack_templates_generated-e3169db2-091f-48c1-85fd-17f53a9d70fe_6bbc2be4-f01e-38e0-a927-72fc1954d651.sql
--{"gen": "erase", "time": 2.0334784984588623, "template": "generated-e3169db2-091f-48c1-85fd-17f53a9d70fe", "dataset": "stack_templates", "rows": 7964}
SELECT *
FROM answer AS a1,
question AS q1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
tag_question AS tq2
WHERE (s1.site_name = 'german' AND s2.site_name = 'scifi' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.site_id = s2.site_id AND tq2.site_id = s2.site_id AND tq2.question_id = q2.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND s2.site_id = u2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id)
