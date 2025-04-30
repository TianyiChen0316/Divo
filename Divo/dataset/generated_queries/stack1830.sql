--stack_templates_generated-2cceca77-0275-4348-81b5-4a166417d439_8dd32daf-6840-30d5-8bf2-4c66feea4a39.sql
--{"gen": "combine", "time": 1.7248470783233643, "template": "generated-2cceca77-0275-4348-81b5-4a166417d439", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
so_user AS u1,
tag_question AS tq1,
badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
site AS s1,
account AS acc,
tag AS t1
WHERE (u1.reputation <= 100000 AND u1.reputation <= 100 AND b1.name = 'Documentation Pioneer' AND b2.name = 'Nice Question' AND s1.site_name = 'english' AND acc.website_url ILIKE '%' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND a1.owner_user_id = u1.id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = u1.id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b1.site_id = a1.site_id AND a1.site_id = so_user.site_id AND a1.site_id = b2.site_id AND so_user.id = a1.owner_user_id AND b2.user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND q1.site_id = tq1.site_id AND acc.id = u1.account_id AND t1.id = tq1.tag_id AND so_user.account_id = acc.id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND t1.site_id = s1.site_id AND t1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = s1.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = s1.site_id AND s1.site_id = so_user.site_id AND so_user.account_id = u1.account_id AND t1.site_id = a1.site_id AND q1.site_id = a1.site_id AND a1.site_id = s1.site_id AND so_user.id = q1.owner_user_id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND q1.owner_user_id = a1.owner_user_id AND q1.id = a1.question_id AND b2.date > b1.date + '11 months'::interval)
 order by count(*) desc LIMIT 100