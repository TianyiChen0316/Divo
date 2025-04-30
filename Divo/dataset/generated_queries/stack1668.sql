--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_e936bfb9-4ba5-3e05-aabd-ad322de8c42a.sql
--{"gen": "combine", "time": 0.7596676349639893, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag_question AS tq1,
site AS s1
WHERE (q.score > 9 AND q.score > 6 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10000 AND q1.favorite_count <= 10 AND s1.site_name = 'computergraphics' AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND tq.site_id = s1.site_id AND b1.site_id = s1.site_id AND t.site_id = s1.site_id AND tq.site_id = t.site_id AND tq.site_id = q.site_id AND u1.site_id = q.site_id AND b1.site_id = q.site_id AND q1.site_id = q.site_id AND t.site_id = q.site_id AND s1.site_id = q.site_id AND tq1.site_id = q.site_id)
