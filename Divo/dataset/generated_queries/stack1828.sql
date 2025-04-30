--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_4364c707-8b88-3089-a67d-9fe44f58c90d.sql
--{"gen": "combine", "time": 1.9874188899993896, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
so_user AS u1,
tag_question AS tq1,
badge AS b2,
so_user AS so_user
WHERE (q.score > 11 AND q.score >= 10 AND t.name IN ('tables', 'tikz-pgf') AND b2.name = 'Documentation Pioneer' AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND t.site_id = tq1.site_id AND tq1.site_id = q.site_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND so_user.id = u1.id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND tq.site_id = so_user.site_id AND tq.site_id = b2.site_id AND u1.site_id = so_user.site_id AND u1.site_id = b2.site_id AND b1.site_id = b2.site_id AND t.site_id = so_user.site_id AND t.site_id = b2.site_id AND so_user.site_id = tq1.site_id AND so_user.site_id = q.site_id AND b2.site_id = tq1.site_id AND b2.site_id = q.site_id AND tq.site_id = t.site_id AND tq.site_id = q.site_id AND t.site_id = q.site_id AND b2.date > b1.date + '11 months'::interval)
