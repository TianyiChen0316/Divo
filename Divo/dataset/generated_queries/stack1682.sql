--stack_templates_generated-3db4a050-7a79-4800-9b58-e1a2e03f26b7_3684bba4-c817-3a7b-84da-3e0eb1e9e2cd.sql
--{"gen": "erase", "time": 1.726017713546753, "template": "generated-3db4a050-7a79-4800-9b58-e1a2e03f26b7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
so_user AS u1,
tag_question AS tq1,
badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (u1.reputation <= 100000 AND u1.reputation >= 10 AND b1.name = 'Documentation Pioneer' AND b2.name = 'API Beta' AND a1.owner_user_id = u1.id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = u1.id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b1.site_id = a1.site_id AND a1.site_id = so_user.site_id AND a1.site_id = b2.site_id AND so_user.id = a1.owner_user_id AND b2.user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND b2.date > b1.date + '11 months'::interval)
 order by count(*) desc LIMIT 100