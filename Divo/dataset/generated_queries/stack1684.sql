--stack_templates_generated-713e9162-90da-460e-888c-34579dca33e7_585b188b-839c-32fb-86fa-b74864b8ea31.sql
--{"gen": "erase", "time": 3.328040361404419, "template": "generated-713e9162-90da-460e-888c-34579dca33e7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
so_user AS u1,
tag_question AS tq1
WHERE (q.score <= 5 AND q.score > 10 AND t.name IN ('tables', 'tikz-pgf') AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id)
