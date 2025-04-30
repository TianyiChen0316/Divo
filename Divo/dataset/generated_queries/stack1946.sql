--stack_templates_generated-c7b0ad0b-1ec3-45fc-93e7-25ad7c1f66ee_0fbd40c9-e6df-3d2a-bb55-7bfc8f81b42c.sql
--{"gen": "combine", "time": 0.7378025054931641, "template": "generated-c7b0ad0b-1ec3-45fc-93e7-25ad7c1f66ee", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
question AS q2,
site AS s2,
so_user AS u2,
tag AS t1,
tag_question AS tq2
WHERE (account.website_url <> '' AND s1.site_name = 'hermeneutics' AND t1.name = 'symfony-components' AND s2.site_name = 'beer' AND account.id = so_user.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id AND t1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q2.site_id = s2.site_id AND tq2.site_id = s2.site_id AND tq2.question_id = q2.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND u1.site_id = t1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND so_user.account_id = u2.account_id)
