--stack_templates_generated-7df990c9-214a-410d-bdef-c4ab4279634e_ce309988-0f29-38df-8e1d-0c4dc1c8641c.sql
--{"gen": "combine", "time": 1.9338159561157227, "template": "generated-7df990c9-214a-410d-bdef-c4ab4279634e", "dataset": "stack_templates", "rows": 632}
SELECT *
FROM answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
question AS q2,
site AS s2,
so_user AS u2,
tag_question AS tq2
WHERE (s1.site_name = 'aviation' AND s2.site_name = 'math' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q2.site_id = s2.site_id AND tq2.site_id = s2.site_id AND tq2.question_id = q2.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND s2.site_id = u2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
