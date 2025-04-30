--stack_templates_q6-072_6cd70d3e-5a7d-3dd4-aa9f-a8865f9412b5.sql
--{"gen": "combine", "time": 0.7955033779144287, "template": "q6-072", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS acc,
badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (s1.site_name = 'stats' AND t1.name IN ('copyright', 'sunyata') AND acc.website_url ILIKE '%' AND b2.name = 'Constable' AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND acc.id = u1.account_id AND b1.user_id = u1.id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND t1.site_id = b1.site_id AND t1.site_id = so_user.site_id AND t1.site_id = b2.site_id AND u1.site_id = b1.site_id AND u1.site_id = so_user.site_id AND u1.site_id = b2.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND q1.site_id = b2.site_id AND so_user.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND account.id = acc.id AND tq1.question_id = c1.post_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND b1.site_id = s1.site_id AND b1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = c1.site_id AND b2.site_id = s1.site_id AND b2.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c1.score > q1.score AND b2.date > b1.date + '11 months'::interval)
