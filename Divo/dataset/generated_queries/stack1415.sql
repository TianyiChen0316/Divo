--stack_templates_generated-b598911c-104c-4b3b-b46a-3d989a19aadb_4a9f9b8d-89ea-3c85-a3fa-fac4938ea88e.sql
--{"gen": "combine", "time": 1.6615071296691895, "template": "generated-b598911c-104c-4b3b-b46a-3d989a19aadb", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS acc,
answer AS a1,
badge AS b,
site AS s
WHERE (account.website_url <> '' AND b1.name = 'Commentator' AND b2.name = 'API Beta' AND q1.favorite_count <= 5000 AND q1.favorite_count >= 5 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND a1.owner_user_id = u1.id AND acc.id = u1.account_id AND b.user_id = u1.id AND q1.id = a1.question_id AND s.site_id = a1.site_id AND s.site_id = b.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND tq1.question_id = a1.question_id AND so_user.id = b.user_id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND b.user_id = b1.user_id AND b.user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND s.site_id = b1.site_id AND s.site_id = b2.site_id AND s.site_id = so_user.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND b1.site_id = a1.site_id AND b1.site_id = b.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND b2.site_id = a1.site_id AND b2.site_id = b.site_id AND tq1.site_id = a1.site_id AND tq1.site_id = b.site_id AND a1.site_id = b.site_id AND a1.site_id = so_user.site_id AND b.site_id = so_user.site_id AND b2.date > b1.date + '11 months'::interval)
