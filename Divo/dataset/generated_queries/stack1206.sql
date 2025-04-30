--stack_templates_generated-ba439fed-1af7-4e19-bcdd-23835115c0a9_ab0578fa-26da-38d5-b79f-8368c4a9440e.sql
--{"gen": "combine", "time": 0.9096319675445557, "template": "generated-ba439fed-1af7-4e19-bcdd-23835115c0a9", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2,
question AS q1,
question AS q2,
tag AS t1,
tag AS t2
WHERE (account.website_url <> '' AND b1.name = 'Famous Question' AND s1.site_name = 'tex' AND t1.name = 'combinatorics' AND t2.name = 'geometry' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.tag_id = t1.id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND q1.owner_user_id = a1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND q1.site_id = tq1.site_id AND q1.id = a1.question_id)
