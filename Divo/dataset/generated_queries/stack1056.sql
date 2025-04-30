--stack_templates_generated-d99b5249-1291-4c1d-abdc-ddda6eb5bf39_2f744c52-34d1-347b-b90a-524d7935b4fa.sql
--{"gen": "combine", "time": 4.318299055099487, "template": "generated-d99b5249-1291-4c1d-abdc-ddda6eb5bf39", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS acc,
badge AS b1,
site AS s,
badge AS b2,
so_user AS so_user
WHERE (s1.site_name = 'tor' AND t1.name = 'report-viewer2012' AND acc.website_url ILIKE '%' AND s.site_name = 'stackoverflow' AND b2.name = 'Legendary' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND acc.id = u1.account_id AND b1.user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND account.id = acc.id AND b1.user_id = a1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b2.user_id = a1.owner_user_id AND acc.id = so_user.account_id AND u1.account_id = so_user.account_id AND t1.site_id = so_user.site_id AND t1.site_id = b2.site_id AND s.site_id = so_user.site_id AND s.site_id = b2.site_id AND u1.site_id = so_user.site_id AND u1.site_id = b2.site_id AND b1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND q1.site_id = b2.site_id AND a1.site_id = so_user.site_id AND a1.site_id = b2.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = tq1.site_id AND s1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval AND b2.date > b1.date + '11 months'::interval)
