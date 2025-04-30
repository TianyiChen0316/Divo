--stack_templates_generated-98dac05d-a0fc-470d-93b6-5483da98b497_b5d76026-1f21-3916-bde1-eacc39c121a8.sql
--{"gen": "combine", "time": 2.120122194290161, "template": "generated-98dac05d-a0fc-470d-93b6-5483da98b497", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
account AS account,
badge AS b1,
badge AS b2,
so_user AS so_user,
site AS s1
WHERE (q1.score > 12 AND q1.score > 12 AND u1.reputation >= 0 AND u1.reputation >= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND account.website_url <> '' AND b1.name = 'Research Assistant' AND b2.name = 'API Beta' AND s1.site_name = 'electronics' AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND b1.user_id = b2.user_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND b1.site_id = b2.site_id AND a1.site_id = s1.site_id AND s1.site_id = b.site_id AND b2.date > b1.date + '11 months'::interval)
 order by count(*) desc LIMIT 100