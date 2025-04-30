--stack_templates_generated-f1cc1057-b4e4-457f-915a-c3910f996fd2_919c1b87-b2fb-3417-a894-efca1e586698.sql
--{"gen": "erase", "time": 0.2925832271575928, "template": "generated-f1cc1057-b4e4-457f-915a-c3910f996fd2", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
account AS acc,
tag AS t1
WHERE (account.website_url <> '' AND b1.name = 'Constable' AND b2.name = 'Constable' AND s1.site_name = 'aviation' AND acc.website_url ILIKE '%en' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND b1.user_id = b2.user_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND b1.site_id = b2.site_id AND acc.id = u1.account_id AND t1.id = tq1.tag_id AND account.id = acc.id AND so_user.account_id = acc.id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND t1.site_id = s1.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND b1.site_id = s1.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND b2.site_id = s1.site_id AND tq1.site_id = so_user.site_id AND s1.site_id = so_user.site_id AND b2.date > b1.date + '11 months'::interval)
