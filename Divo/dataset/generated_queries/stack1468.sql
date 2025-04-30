--stack_templates_generated-2d13926b-edd2-42ef-aad8-47c9b8b1c1e6_2fc6751b-b567-3b4a-9a7b-115467ee84f4.sql
--{"gen": "combine", "time": 3.6895687580108643, "template": "generated-2d13926b-edd2-42ef-aad8-47c9b8b1c1e6", "dataset": "stack_templates", "rows": 3}
SELECT count(*),
t1.name
FROM question AS q1,
site AS s,
tag AS t1,
tag_question AS tq1,
account AS acc,
badge AS b1,
so_user AS u1
WHERE (s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count >= 1 AND q1.favorite_count >= 1 AND acc.website_url ILIKE '%en' AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.owner_user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = u1.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id)
 group by t1.name