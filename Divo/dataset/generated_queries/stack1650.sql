--stack_templates_generated-ad32956d-48f5-47fa-ac27-897598e938e0_3e242e57-8809-3cd2-b862-10300cff1a7c.sql
--{"gen": "combine", "time": 0.8809959888458252, "template": "generated-ad32956d-48f5-47fa-ac27-897598e938e0", "dataset": "stack_templates", "rows": 1}
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
site AS s,
tag AS t1,
question AS q2,
tag AS t2,
tag_question AS tq2
WHERE (account.website_url <> '' AND b1.name = 'Custodian' AND s1.site_name = 'vegetarianism' AND s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count <= 10 AND q1.favorite_count >= 5 AND t2.name = 'shell-script' AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND s.site_id = u1.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND u1.site_id = q1.site_id AND q1.site_id = a1.site_id AND q1.site_id = s1.site_id AND q1.id = a1.question_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id)
