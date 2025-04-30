--stack_templates_generated-e3169db2-091f-48c1-85fd-17f53a9d70fe_e7a501f7-a6eb-3db8-8713-4fa502525489.sql
--{"gen": "combine", "time": 0.7437570095062256, "template": "generated-e3169db2-091f-48c1-85fd-17f53a9d70fe", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag AS t1,
tag_question AS tq1,
tag_question AS tq2,
tag AS t,
tag_question AS tq
WHERE (s1.site_name = 'islam' AND t1.name = 'excel' AND s2.site_name = '3dprinting' AND t.name IN ('tables', 'tikz-pgf') AND t1.site_id = s1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.tag_id = t1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.site_id = s2.site_id AND tq2.site_id = s2.site_id AND tq2.question_id = q2.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND tq.tag_id = t.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = tq1.site_id AND t1.site_id = t.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = a1.site_id AND t.site_id = tq1.site_id AND tq.site_id = s1.site_id AND t.site_id = s1.site_id)
