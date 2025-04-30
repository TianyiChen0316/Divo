--stack_templates_generated-f70fcaee-375a-4629-beb8-a85f21733495_b0a85684-3bf5-37a2-8acd-efe9c1ca4584.sql
--{"gen": "combine", "time": 0.7531559467315674, "template": "generated-f70fcaee-375a-4629-beb8-a85f21733495", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
answer AS a1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
site AS s,
badge AS b1,
badge AS b2,
so_user AS so_user,
account AS account
WHERE (q.score <= 5 AND q.score > 6 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 1 AND q1.favorite_count <= 1 AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND u1.downvotes >= 10 AND u1.downvotes <= 100000 AND s.site_name IN ('askubuntu', 'math') AND b1.name = 'Legendary' AND b2.name = 'API Evangelist' AND account.website_url <> '' AND tq.question_id = q.id AND tq.tag_id = t.id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = a1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND a1.site_id = tq1.site_id AND a1.site_id = q.site_id AND tq1.site_id = q.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND tq.site_id = s.site_id AND s.site_id = t.site_id AND s.site_id = a1.site_id AND s.site_id = q.site_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND account.id = so_user.account_id AND account.id = u1.account_id AND so_user.account_id = u1.account_id AND b2.date > b1.date + '11 months'::interval)
