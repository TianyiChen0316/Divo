--stack_templates_generated-98dac05d-a0fc-470d-93b6-5483da98b497_47abab40-5a8c-3f51-aa96-b2fd226e39a2.sql
--{"gen": "erase", "time": 3.960789918899536, "template": "generated-98dac05d-a0fc-470d-93b6-5483da98b497", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (q1.score <= 10 AND q1.score > 15 AND u1.reputation <= 10 AND u1.reputation >= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.id = tq1.question_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
 order by count(*) desc LIMIT 100