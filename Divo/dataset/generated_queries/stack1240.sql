--stack_templates_q6-072_655c9729-2e01-3516-8b81-5aafb6eb11fc.sql
--{"gen": "combine", "time": 0.24125170707702637, "template": "q6-072", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
question AS q2,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'codereview' AND t1.name IN ('copyright', 'sunyata') AND t2.name = 'filenet-content-engine' AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND a1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND account.id = u2.account_id AND q1.owner_user_id = a1.owner_user_id AND tq1.question_id = c1.post_id AND tq1.question_id = a1.question_id AND c1.post_id = a1.question_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND c1.score > q1.score)
