--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_0c4edd72-fcd9-36b7-b091-c6a1eb885cec.sql
--{"gen": "combine", "time": 3.2384860515594482, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (q.score >= 0 AND q.score > 15 AND t.name IN ('tables', 'tikz-pgf') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.score >= 10 AND q1.score <= 0 AND u1.reputation >= 0 AND u1.reputation >= 10 AND tq.question_id = q.id AND tq.tag_id = t.id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND q1.id = a1.question_id AND q1.id = tq1.question_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND b.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND b.user_id = a1.owner_user_id AND tq.site_id = t.site_id AND tq.site_id = q.site_id AND u1.site_id = q.site_id AND q1.site_id = q.site_id AND t.site_id = q.site_id AND a1.site_id = q.site_id AND b.site_id = q.site_id AND tq1.site_id = q.site_id)
