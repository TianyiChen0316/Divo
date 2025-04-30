--stack_templates_generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61_c8f3ffdf-dcf6-356f-b461-495a456074db.sql
--{"gen": "combine", "time": 0.9766428470611572, "template": "generated-7a7382ea-4cbf-427a-9aee-dfe5140c4d61", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
so_user AS u1,
tag_question AS tq1,
account AS account,
site AS s1
WHERE (q1.favorite_count >= 5 AND q1.favorite_count <= 10000 AND u1.downvotes >= 10 AND u1.downvotes <= 10 AND s1.site_name = '3dprinting' AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id)
