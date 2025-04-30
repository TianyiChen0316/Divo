--stack_templates_generated-7a566bad-d724-4d1c-a229-77d12128eb83_b17f7a40-c506-3eb5-9d0a-bbe8be095452.sql
--{"gen": "combine", "time": 0.33637428283691406, "template": "generated-7a566bad-d724-4d1c-a229-77d12128eb83", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
comment AS c1,
comment AS c2,
post_link AS pl,
tag_question AS tq2,
question AS question,
tag_question AS tag_question,
badge AS b1,
badge AS b2,
so_user AS so_user,
account AS account
WHERE (q1.favorite_count <= 10000 AND q1.favorite_count <= 10000 AND s.site_name = 'photo' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b1.name = 'API Evangelist' AND b2.name = 'Commentator' AND account.website_url <> '' AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tag_question.question_id = question.id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = c1.post_id AND tq1.question_id = pl.post_id_from AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = question.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = question.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND question.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = pl.site_id AND question.site_id = tq1.site_id AND question.site_id = c1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND tag_question.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND tq2.tag_id = t1.id AND tag_question.tag_id = t1.id AND tq2.site_id = t1.site_id AND tq2.site_id = s.site_id AND tq2.site_id = u1.site_id AND c2.site_id = t1.site_id AND c2.site_id = s.site_id AND c2.site_id = u1.site_id AND question.site_id = t1.site_id AND question.site_id = s.site_id AND question.site_id = u1.site_id AND t1.site_id = u1.site_id AND t1.site_id = tag_question.site_id AND t1.site_id = q1.site_id AND t1.site_id = pl.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND s.site_id = tag_question.site_id AND s.site_id = pl.site_id AND s.site_id = c1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = q1.site_id AND u1.site_id = pl.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND account.id = so_user.account_id AND account.id = u1.account_id AND so_user.account_id = u1.account_id AND c1.date < c2.date AND b2.date > b1.date + '11 months'::interval)
