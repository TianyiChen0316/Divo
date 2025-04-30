--stack_templates_generated-98262b24-b055-42af-a2c0-50b9899903a3_1e67f02b-5bf8-3baa-aab8-a5227dc6fed3.sql
--{"gen": "combine", "time": 0.19768714904785156, "template": "generated-98262b24-b055-42af-a2c0-50b9899903a3", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
site AS s,
account AS account,
badge AS b2,
so_user AS so_user
WHERE (q.score <= 10 AND q.score > 10 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10000 AND q1.favorite_count >= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s.site_name IN ('tex') AND account.website_url <> '' AND b2.name = 'Not a Robot' AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND q.site_id = s.site_id AND t.site_id = s.site_id AND tq.site_id = s.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND tq.site_id = so_user.site_id AND tq.site_id = b2.site_id AND t1.site_id = so_user.site_id AND t1.site_id = b2.site_id AND s.site_id = so_user.site_id AND s.site_id = b2.site_id AND u1.site_id = so_user.site_id AND u1.site_id = b2.site_id AND b1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND q1.site_id = b2.site_id AND t.site_id = so_user.site_id AND t.site_id = b2.site_id AND so_user.site_id = tq1.site_id AND so_user.site_id = q.site_id AND b2.site_id = tq1.site_id AND b2.site_id = q.site_id AND b2.date > b1.date + '11 months'::interval)
