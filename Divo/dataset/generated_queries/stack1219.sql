--stack_templates_ff8e9a7c5dc15a17287f917e101f0e5f2987b296_fbd1bae6-7136-3921-b66c-45391622295b.sql
--{"gen": "combine", "time": 2.025339126586914, "template": "ff8e9a7c5dc15a17287f917e101f0e5f2987b296", "dataset": "stack_templates", "rows": 4}
SELECT count(*),
t1.name
FROM answer AS a1,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
so_user AS u2,
tag AS t2,
tag_question AS tq2
WHERE (q1.favorite_count <= 5000 AND q1.favorite_count <= 10000 AND s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND u1.downvotes >= 0 AND u1.downvotes <= 1 AND t2.name = '16.04' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND s.site_id = a1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u2.account_id = account.id AND tq2.site_id = t2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = u2.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id)
 group by t1.name