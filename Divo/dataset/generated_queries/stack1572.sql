--stack_templates_generated-c3016bce-e4e3-4069-bcc0-f9645ca75610_94ea1ddf-36ea-319c-855e-fd2007c11359.sql
--{"gen": "combine", "time": 0.2127218246459961, "template": "generated-c3016bce-e4e3-4069-bcc0-f9645ca75610", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q2,
site AS s1,
so_user AS u1,
so_user AS u2,
badge AS b1,
so_user AS so_user,
account AS acc,
question AS q1,
tag AS t1,
tag_question AS tq1
WHERE (s1.site_name = 'photo' AND b1.name = 'Epic' AND acc.website_url ILIKE '%de' AND q1.favorite_count <= 1 AND q1.favorite_count >= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND acc.id = u1.account_id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = acc.id AND acc.id = u2.account_id AND b1.user_id = q1.owner_user_id AND acc.id = so_user.account_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = a1.owner_user_id AND u1.id = b1.user_id AND b1.user_id = a1.owner_user_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND q1.site_id = a1.site_id AND q1.site_id = s1.site_id AND q1.site_id = so_user.site_id AND a1.site_id = tq1.site_id AND a1.site_id = so_user.site_id AND tq1.site_id = s1.site_id AND tq1.site_id = so_user.site_id AND s1.site_id = so_user.site_id)
