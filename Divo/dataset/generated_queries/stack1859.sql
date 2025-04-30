--stack_templates_generated-ce43b83c-1dc2-4db7-8b02-ac38c4c96ccc_88453dd9-d2c0-3ffc-bf27-7898e56ab79c.sql
--{"gen": "erase", "time": 1.72039794921875, "template": "generated-ce43b83c-1dc2-4db7-8b02-ac38c4c96ccc", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
account AS account,
badge AS b1,
so_user AS so_user,
site AS s1
WHERE (q1.score > 5 AND q1.score > 11 AND u1.reputation <= 100 AND u1.reputation >= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND account.website_url <> '' AND b1.name = 'Caucus' AND s1.site_name = 'music' AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND s1.site_id = b.site_id)
 order by count(*) desc LIMIT 100