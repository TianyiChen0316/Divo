--stack_templates_generated-14cc2e3c-2812-4434-ab6c-5d95f852914c_f962dd3b-d8d4-3a34-bb3b-080c7be7f160.sql
--{"gen": "combine", "time": 0.9179811477661133, "template": "generated-14cc2e3c-2812-4434-ab6c-5d95f852914c", "dataset": "stack_templates", "rows": 1}
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
site AS s,
tag AS t1
WHERE (account.website_url <> '' AND b1.name = 'Nice Question' AND b2.name = 'Not a Robot' AND s1.site_name = 'bicycles' AND acc.website_url ILIKE '%org' AND s.site_name = 'chemistry' AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND b1.user_id = b2.user_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND b1.site_id = b2.site_id AND acc.id = u1.account_id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND account.id = acc.id AND so_user.account_id = acc.id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND t1.site_id = s1.site_id AND t1.site_id = so_user.site_id AND s.site_id = b2.site_id AND s.site_id = s1.site_id AND s.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND b1.site_id = s1.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND b2.site_id = s1.site_id AND tq1.site_id = so_user.site_id AND s1.site_id = so_user.site_id AND b2.date > b1.date + '11 months'::interval)
