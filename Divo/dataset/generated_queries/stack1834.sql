--stack_templates_generated-11fed098-a005-4574-9791-d4153030fa93_f68ef58b-a026-3857-9fd3-07c17653cece.sql
--{"gen": "combine", "time": 0.13502931594848633, "template": "generated-11fed098-a005-4574-9791-d4153030fa93", "dataset": "stack_templates", "rows": 3}
SELECT count(*),
t1.name
FROM question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
comment AS c1,
site AS s1
WHERE (t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count <= 5000 AND q1.favorite_count >= 1 AND u1.downvotes <= 100000 AND u1.downvotes <= 1 AND s1.site_name = 'stats' AND q1.owner_user_id = u1.id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = c1.post_id AND t1.site_id = c1.site_id AND u1.site_id = s1.site_id AND u1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c1.score > q1.score)
 group by t1.name