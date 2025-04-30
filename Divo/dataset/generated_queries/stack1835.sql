--stack_templates_generated-cb4ca1e0-113e-40be-b986-f54ca44b08e8_74d90055-35cc-349d-b453-39976f5f382c.sql
--{"gen": "combine", "time": 0.6696279048919678, "template": "generated-cb4ca1e0-113e-40be-b986-f54ca44b08e8", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag_question AS tq,
tag AS t,
question AS q1,
so_user AS u1,
tag_question AS tq1,
account AS account,
answer AS a1,
site AS s1,
badge AS b1,
so_user AS so_user,
badge AS b2
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 5 AND q1.favorite_count <= 1 AND s1.site_name = 'hsm' AND b1.name = 'Caucus' AND b2.name = 'API Evangelist' AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND account.id = so_user.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = b2.user_id AND b1.site_id = b2.site_id AND b2.date > b1.date + '11 months'::interval)
