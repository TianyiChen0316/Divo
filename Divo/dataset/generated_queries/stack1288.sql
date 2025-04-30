--stack_templates_generated-df03f412-ca53-4ded-8ec4-70f49e87950f_4319b877-e31f-3a4e-a55e-3c464f25730c.sql
--{"gen": "combine", "time": 0.32329797744750977, "template": "generated-df03f412-ca53-4ded-8ec4-70f49e87950f", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag_question AS tq1,
site AS s1
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 0 AND q1.favorite_count >= 0 AND s1.site_name = 'wordpress' AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND tq.site_id = s1.site_id AND b1.site_id = s1.site_id AND t.site_id = s1.site_id)
