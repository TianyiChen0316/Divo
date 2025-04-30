--stack_templates_generated-ba439fed-1af7-4e19-bcdd-23835115c0a9_2876d490-da20-36d1-80dc-dff9ee221977.sql
--{"gen": "combine", "time": 1.7806119918823242, "template": "generated-ba439fed-1af7-4e19-bcdd-23835115c0a9", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2,
site AS s,
tag_question AS tq,
tag AS t,
question AS q1,
tag AS t1
WHERE (account.website_url <> '' AND s1.site_name = 'ux' AND s.site_name IN ('tex') AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 1 AND q1.favorite_count >= 1 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND tq.site_id = s.site_id AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND t1.site_id = s.site_id AND s.site_id = u1.site_id AND s.site_id = q1.site_id AND s.site_id = t.site_id AND s.site_id = tq1.site_id AND q1.id = a1.question_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND q1.site_id = a1.site_id AND q1.site_id = s1.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND q1.owner_user_id = a1.owner_user_id)
