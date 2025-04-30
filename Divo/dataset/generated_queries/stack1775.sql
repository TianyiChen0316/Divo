--stack_templates_generated-315356e4-7786-4d00-9d0e-3caf0a6b9184_7e0e5c31-f187-319c-bf8d-7dc12734b269.sql
--{"gen": "combine", "time": 0.29154372215270996, "template": "generated-315356e4-7786-4d00-9d0e-3caf0a6b9184", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
site AS s1,
so_user AS u1,
tag_question AS tq1,
tag AS t,
tag_question AS tq,
badge AS b1,
answer AS a1,
badge AS b2,
so_user AS so_user
WHERE (s1.site_name = 'philosophy' AND t.name IN ('tables', 'tikz-pgf') AND b2.name = 'Custodian' AND tq1.site_id = s1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND b1.user_id = a1.owner_user_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = a1.owner_user_id AND tq.site_id = b2.site_id AND u1.site_id = b2.site_id AND t.site_id = b2.site_id AND a1.site_id = b2.site_id AND s1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND tq.site_id = so_user.site_id AND u1.site_id = so_user.site_id AND t.site_id = so_user.site_id AND a1.site_id = so_user.site_id AND s1.site_id = so_user.site_id AND so_user.site_id = tq1.site_id AND b2.date > b1.date + '11 months'::interval)
