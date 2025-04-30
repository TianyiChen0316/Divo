--stack_templates_generated-1cbd8d48-8a91-4c39-ad3d-5ae652f65eb8_93b2acb2-461d-3adc-8de4-60f1574a8443.sql
--{"gen": "combine", "time": 0.6075305938720703, "template": "generated-1cbd8d48-8a91-4c39-ad3d-5ae652f65eb8", "dataset": "stack_templates", "rows": 4}
SELECT count(*),
t1.name
FROM question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS acc,
answer AS a1,
badge AS b
WHERE (s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count <= 10 AND q1.favorite_count <= 10000 AND u1.downvotes <= 10 AND u1.downvotes <= 1 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND acc.id = u1.account_id AND b.user_id = u1.id AND q1.id = a1.question_id AND s.site_id = a1.site_id AND s.site_id = b.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = a1.owner_user_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND b.site_id = tq1.site_id)
 group by t1.name