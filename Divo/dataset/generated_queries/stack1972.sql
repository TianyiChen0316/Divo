--stack_templates_generated-907e836d-7a2a-4a5f-8fb5-cf36817d4355_0e11ce17-3208-38af-b550-5666d69fe6a0.sql
--{"gen": "erase", "time": 0.1471543312072754, "template": "generated-907e836d-7a2a-4a5f-8fb5-cf36817d4355", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
tag AS t,
tag_question AS tq,
answer AS a1,
badge AS b
WHERE (s1.site_name = 'es' AND t.name IN ('tables', 'tikz-pgf') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND tq.tag_id = t.id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND q1.id = a1.question_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND u1.site_id = t.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND q1.site_id = t.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND b.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND b.user_id = a1.owner_user_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND tq.site_id = s1.site_id AND t.site_id = s1.site_id AND a1.site_id = s1.site_id AND s1.site_id = b.site_id)
