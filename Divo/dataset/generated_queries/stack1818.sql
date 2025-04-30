--stack_templates_generated-c5df9d2c-aaaa-4177-b3c1-262b73295ff2_4a545872-23f7-30a1-ab3e-81fdb101b091.sql
--{"gen": "combine", "time": 1.4546754360198975, "template": "generated-c5df9d2c-aaaa-4177-b3c1-262b73295ff2", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM post_link AS pl,
question AS q1,
question AS q2,
tag AS tag,
tag_question AS tq1,
tag_question AS tq2,
answer AS a1,
site AS s,
so_user AS u1,
tag AS t1
WHERE (tag.name IN ('wpf', '.net', 'json') AND s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND u1.downvotes >= 0 AND u1.downvotes <= 100000 AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND tag.id = tq1.tag_id AND tag.site_id = tq1.site_id AND tag.id = tq2.tag_id AND tag.site_id = tq1.site_id AND tag.site_id = pl.site_id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.site_id = q2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = tq1.tag_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND tq2.site_id = tag.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND tag.site_id = q2.site_id AND tag.site_id = q1.site_id AND q2.site_id = q1.site_id AND q2.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND pl.post_id_to = tq2.question_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND q1.owner_user_id = u1.id AND s.site_id = a1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND tq2.tag_id = t1.id AND tag.id = t1.id AND tq2.site_id = t1.site_id AND tq2.site_id = s.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = a1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tag.site_id AND t1.site_id = pl.site_id AND t1.site_id = q2.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND s.site_id = tag.site_id AND s.site_id = pl.site_id AND s.site_id = q2.site_id AND u1.site_id = q1.site_id AND u1.site_id = tag.site_id AND u1.site_id = pl.site_id AND u1.site_id = q2.site_id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND tag.site_id = a1.site_id AND pl.site_id = a1.site_id AND q2.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.owner_user_id = a1.owner_user_id AND tq1.question_id = a1.question_id AND a1.question_id = pl.post_id_from)
