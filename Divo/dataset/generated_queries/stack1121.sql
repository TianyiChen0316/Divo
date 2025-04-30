--stack_templates_generated-b3a059d6-ad3e-46ee-a136-ce7f2ba016a2_88cd086d-7e93-3cc7-8fd7-74a5dbb30266.sql
--{"gen": "combine", "time": 2.0404303073883057, "template": "generated-b3a059d6-ad3e-46ee-a136-ce7f2ba016a2", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2,
question AS q1,
account AS acc,
site AS s,
tag AS t1
WHERE (account.website_url <> '' AND b1.name = 'API Evangelist' AND s1.site_name = 'outdoors' AND acc.website_url ILIKE '%code%' AND s.site_name = 'emacs' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND u1.site_id = q1.site_id AND q1.site_id = tq1.site_id AND acc.id = u1.account_id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = so_user.site_id AND t1.site_id = s1.site_id AND t1.site_id = tq1.site_id AND s.site_id = a1.site_id AND s.site_id = so_user.site_id AND s.site_id = s1.site_id AND u1.site_id = b1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND a1.site_id = so_user.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = tq1.site_id AND account.id = acc.id AND acc.id = so_user.account_id AND acc.id = u2.account_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
