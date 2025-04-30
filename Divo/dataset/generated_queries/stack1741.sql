--stack_templates_generated-df03f412-ca53-4ded-8ec4-70f49e87950f_7f69f28f-49da-38f8-8a0e-c0c9c9bd4439.sql
--{"gen": "combine", "time": 0.3505239486694336, "template": "generated-df03f412-ca53-4ded-8ec4-70f49e87950f", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag_question AS tq1,
site AS s1,
account AS account,
comment AS c1,
tag AS t1
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 5000 AND q1.favorite_count <= 5000 AND s1.site_name = 'quant' AND t1.name IN ('copyright', 'sunyata') AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND tq.site_id = s1.site_id AND b1.site_id = s1.site_id AND t.site_id = s1.site_id AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND t1.site_id = s1.site_id AND tq1.tag_id = t1.id AND tq1.question_id = c1.post_id AND tq.site_id = t1.site_id AND tq.site_id = c1.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = c1.site_id AND b1.site_id = c1.site_id AND t.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c1.score > q1.score)
