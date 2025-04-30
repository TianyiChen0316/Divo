--stack_templates_generated-285e9c3e-5768-4402-9387-78c261e72a4a_40afba3b-bf72-38f9-a3c4-59645683ffbb.sql
--{"gen": "combine", "time": 0.9446518421173096, "template": "generated-285e9c3e-5768-4402-9387-78c261e72a4a", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
so_user AS u2,
tag AS t2,
tag_question AS tq2
WHERE (s1.site_name = 'pm' AND t2.name = 'if-statement' AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = u2.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND q1.owner_user_id = a1.owner_user_id AND tq1.question_id = c1.post_id AND c1.post_id = a1.question_id AND c1.score > q1.score AND a1.creation_date >= q1.creation_date + '1 year'::interval)
