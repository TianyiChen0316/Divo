--stack_templates_generated-de3a2f9c-021a-44d1-8eb8-b733462314ac_385611de-1e69-3443-884c-bd7ebe638e16.sql
--{"gen": "combine", "time": 0.2624208927154541, "template": "generated-de3a2f9c-021a-44d1-8eb8-b733462314ac", "dataset": "stack_templates", "rows": 1}
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
tag AS t1,
account AS acc,
site AS s,
badge AS b2
WHERE (account.website_url <> '' AND b1.name = 'Documentation Pioneer' AND s1.site_name = 'academia' AND t1.name = 'server' AND acc.website_url ILIKE '%com' AND s.site_name = 'hsm' AND b2.name = 'Illuminator' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.tag_id = t1.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND q1.site_id = tq1.site_id AND acc.id = u1.account_id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND b1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND s.site_id = so_user.site_id AND s.site_id = b2.site_id AND account.id = acc.id AND acc.id = so_user.account_id AND acc.id = u2.account_id AND t1.site_id = b1.site_id AND t1.site_id = so_user.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND u1.site_id = b1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND a1.site_id = so_user.site_id AND a1.site_id = b2.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = tq1.site_id AND s1.site_id = b2.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = b1.user_id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = a1.owner_user_id AND u1.id = b1.user_id AND b1.user_id = a1.owner_user_id AND a1.creation_date >= q1.creation_date + '1 year'::interval AND b2.date > b1.date + '11 months'::interval)
