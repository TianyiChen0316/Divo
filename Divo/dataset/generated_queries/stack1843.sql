--stack_templates_generated-14cc2e3c-2812-4434-ab6c-5d95f852914c_0d03656b-2d83-3f3e-80bd-883116e342d0.sql
--{"gen": "combine", "time": 0.11504459381103516, "template": "generated-14cc2e3c-2812-4434-ab6c-5d95f852914c", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
tag AS t1
WHERE (account.website_url <> '' AND b1.name = 'Research Assistant' AND b2.name = 'Constable' AND s1.site_name = 'serverfault' AND t1.name = 'static-allocation' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND b1.user_id = b2.user_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND b1.site_id = b2.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.tag_id = t1.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND q1.owner_user_id = a1.owner_user_id AND tq1.question_id = a1.question_id AND b2.date > b1.date + '11 months'::interval AND a1.creation_date >= q1.creation_date + '1 year'::interval)
