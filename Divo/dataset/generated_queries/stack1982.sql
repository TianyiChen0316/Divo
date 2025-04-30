--stack_templates_generated-fcfa7eb8-a908-4695-9fd9-c82e0855a549_74f5a248-788b-32b6-888f-e77c26ade34f.sql
--{"gen": "combine", "time": 0.4955604076385498, "template": "generated-fcfa7eb8-a908-4695-9fd9-c82e0855a549", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1,
site AS s,
account AS account,
badge AS b2,
so_user AS so_user
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10 AND q1.favorite_count >= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s.site_name IN ('askubuntu', 'math') AND account.website_url <> '' AND b2.name = 'Commentator' AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND tq.site_id = a1.site_id AND t1.site_id = a1.site_id AND u1.site_id = a1.site_id AND q1.site_id = a1.site_id AND t.site_id = a1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND tq.site_id = s.site_id AND s.site_id = t.site_id AND s.site_id = a1.site_id AND a1.owner_user_id = b1.user_id AND s.site_id = b1.site_id AND b1.site_id = a1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b2.user_id = a1.owner_user_id AND tq.site_id = so_user.site_id AND tq.site_id = b2.site_id AND t1.site_id = so_user.site_id AND t1.site_id = b2.site_id AND s.site_id = so_user.site_id AND s.site_id = b2.site_id AND u1.site_id = so_user.site_id AND u1.site_id = b2.site_id AND b1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND q1.site_id = b2.site_id AND t.site_id = so_user.site_id AND t.site_id = b2.site_id AND a1.site_id = so_user.site_id AND a1.site_id = b2.site_id AND so_user.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND b2.date > b1.date + '11 months'::interval)
