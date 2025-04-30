--stack_templates_generated-15f27770-6805-4873-90a5-30b02ce66a4c_516a6e51-2b0e-3a10-bdff-52c4fcb60a69.sql
--{"gen": "combine", "time": 2.7177541255950928, "template": "generated-15f27770-6805-4873-90a5-30b02ce66a4c", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
so_user AS u2,
tag AS t2,
tag_question AS tq1,
badge AS b1,
so_user AS so_user,
comment AS c1,
tag AS t1
WHERE (s1.site_name = 'apple' AND t2.name = 'jquery-ui' AND b1.name = 'API Beta' AND t1.name IN ('copyright', 'sunyata') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND account.id = u2.account_id AND account.id = so_user.account_id AND u2.account_id = so_user.account_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t2.site_id = u2.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND t1.site_id = s1.site_id AND tq1.tag_id = t1.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = c1.site_id AND a1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND c1.post_id = a1.question_id AND c1.score > q1.score)
