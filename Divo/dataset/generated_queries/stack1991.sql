--stack_templates_generated-d51e1812-da5e-4107-aea2-8de2f1c072e3_dd177c1a-722e-3d52-acf8-96485c92015b.sql
--{"gen": "erase", "time": 0.23593997955322266, "template": "generated-d51e1812-da5e-4107-aea2-8de2f1c072e3", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
badge AS b1,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
badge AS b2,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u2
WHERE (acc.website_url ILIKE '%me' AND q1.favorite_count >= 1 AND q1.favorite_count <= 10000 AND s.site_name = 'hsm' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND account.website_url <> '' AND b2.name = 'Famous Question' AND s1.site_name = 'wordpress' AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND t1.site_id = b2.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = b2.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND q1.owner_user_id = b1.user_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND s.site_id = so_user.site_id AND s.site_id = b2.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND acc.id = u2.account_id AND t1.site_id = s1.site_id AND t1.site_id = a1.site_id AND s.site_id = s1.site_id AND s.site_id = a1.site_id AND b1.site_id = s1.site_id AND b1.site_id = a1.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = a1.site_id AND b2.site_id = s1.site_id AND b2.site_id = a1.site_id AND b2.date > b1.date + '11 months'::interval)
