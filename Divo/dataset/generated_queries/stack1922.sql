--stack_templates_generated-ee79923e-8e9c-4cdc-ad22-4c54ffbb3eae_38472a59-d6c1-374e-8dd3-68c4b0a20c2c.sql
--{"gen": "combine", "time": 1.441946029663086, "template": "generated-ee79923e-8e9c-4cdc-ad22-4c54ffbb3eae", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
site AS s1,
so_user AS u1,
so_user AS u2,
comment AS c1,
question AS q1,
tag AS t1,
tag_question AS tq1,
question AS q2
WHERE (s1.site_name = 'tex' AND t1.name IN ('copyright', 'sunyata') AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = tq1.site_id AND a1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND q1.owner_user_id = a1.owner_user_id AND tq1.question_id = c1.post_id AND tq1.question_id = a1.question_id AND c1.post_id = a1.question_id AND c1.score > q1.score)
