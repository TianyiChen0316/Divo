--stack_templates_ff8e9a7c5dc15a17287f917e101f0e5f2987b296_df2ff638-fd09-3bdb-aa75-a5e30494597d.sql
--{"gen": "erase", "time": 0.21223711967468262, "template": "ff8e9a7c5dc15a17287f917e101f0e5f2987b296", "dataset": "stack_templates", "rows": 4}
SELECT count(*),
t1.name
FROM answer AS a1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count >= 1 AND q1.favorite_count >= 5 AND u1.downvotes >= 0 AND u1.downvotes <= 1 AND q1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND q1.owner_user_id = a1.owner_user_id AND tq1.question_id = a1.question_id AND u1.site_id = t1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
 group by t1.name