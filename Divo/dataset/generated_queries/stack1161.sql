--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_b38613f3-0948-3e60-ac3e-5314ceaf7383.sql
--{"gen": "combine", "time": 0.10498905181884766, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
answer AS a1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (q.score <= 0 AND q.score > 13 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 0 AND q1.favorite_count >= 5 AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND u1.downvotes <= 10 AND u1.downvotes <= 1 AND tq.question_id = q.id AND tq.tag_id = t.id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = a1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND a1.site_id = tq1.site_id AND a1.site_id = q.site_id AND tq1.site_id = q.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id)
