--stack_templates_generated-b94cc0d4-0c80-443b-953f-2ab295388b50_5085679b-35c2-3196-a290-460cb28ccf1c.sql
--{"gen": "erase", "time": 0.5464823246002197, "template": "generated-b94cc0d4-0c80-443b-953f-2ab295388b50", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
badge AS b1,
badge AS b2,
tag AS t,
tag_question AS tq
WHERE (q1.score > 9 AND q1.score <= 10 AND u1.reputation >= 0 AND u1.reputation <= 100 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND b1.name = 'API Beta' AND b2.name = 'Legendary' AND t.name IN ('tables', 'tikz-pgf') AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND b1.user_id = u1.id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b1.site_id = a1.site_id AND b1.site_id = b.site_id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND b.user_id = b1.user_id AND b1.user_id = a1.owner_user_id AND tq.tag_id = t.id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND tq.site_id = b1.site_id AND tq.site_id = b2.site_id AND b1.site_id = t.site_id AND t.site_id = b2.site_id AND b2.date > b1.date + '11 months'::interval)
 order by count(*) desc LIMIT 100