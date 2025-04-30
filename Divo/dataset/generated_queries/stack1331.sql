--stack_templates_generated-8727f778-7bf1-44dc-9f97-77147e9a4b5c_ca44f269-d9d7-3e06-ab82-e2950d858e56.sql
--{"gen": "erase", "time": 0.44442272186279297, "template": "generated-8727f778-7bf1-44dc-9f97-77147e9a4b5c", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
so_user AS u1,
tag_question AS tq1,
account AS account,
badge AS b2,
so_user AS so_user
WHERE (q.score > 10 AND q.score <= 0 AND t.name IN ('tables', 'tikz-pgf') AND account.website_url <> '' AND b2.name = 'Sheriff' AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND so_user.id = u1.id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND tq.site_id = so_user.site_id AND tq.site_id = b2.site_id AND u1.site_id = so_user.site_id AND u1.site_id = b2.site_id AND b1.site_id = b2.site_id AND t.site_id = so_user.site_id AND t.site_id = b2.site_id AND so_user.site_id = tq1.site_id AND so_user.site_id = q.site_id AND b2.site_id = tq1.site_id AND b2.site_id = q.site_id AND b2.date > b1.date + '11 months'::interval)
