--stack_templates_generated-b5dfcc63-be9a-41df-a6d0-55346e4e53ff_38472a59-d6c1-374e-8dd3-68c4b0a20c2c.sql
--{"gen": "combine", "time": 0.12484407424926758, "template": "generated-b5dfcc63-be9a-41df-a6d0-55346e4e53ff", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
question AS q1,
site AS s,
tag AS t1
WHERE (account.website_url <> '' AND s1.site_name = 'magento' AND q1.favorite_count <= 10 AND q1.favorite_count >= 1 AND s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND account.id = so_user.account_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND so_user.account_id = u1.account_id AND a1.question_id = q1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = a1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND t1.site_id = tq1.site_id AND s.site_id = s1.site_id AND u1.site_id = q1.site_id AND q1.site_id = a1.site_id AND q1.site_id = s1.site_id AND q1.site_id = tq1.site_id AND q1.owner_user_id = a1.owner_user_id)
