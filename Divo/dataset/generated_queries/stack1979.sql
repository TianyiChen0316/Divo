--stack_templates_generated-c6cf83c6-7abb-475d-b4c2-657a274b68ca_cd4b6dde-6087-31ad-a1db-932b92ca4e33.sql
--{"gen": "combine", "time": 0.1233665943145752, "template": "generated-c6cf83c6-7abb-475d-b4c2-657a274b68ca", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
so_user AS u2,
tag AS t2,
tag_question AS tq1,
tag AS t1,
question AS q2,
tag_question AS tq2
WHERE (s1.site_name = 'iot' AND t2.name = 'match-phrase' AND t1.name = 'text-processing' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t2.site_id = u2.site_id AND t1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id)
