--stack_templates_generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61_f3b056ca-3442-39e5-9b84-d4fe4fb8f577.sql
--{"gen": "combine", "time": 1.2865288257598877, "template": "generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
site AS s1,
site AS s2,
so_user AS u2
WHERE (q1.favorite_count >= 1 AND q1.favorite_count >= 5 AND u1.downvotes <= 100000 AND u1.downvotes >= 10 AND s1.site_name = 'cstheory' AND s2.site_name = 'german' AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND s2.site_id = u2.site_id AND q1.owner_user_id = a1.owner_user_id)
