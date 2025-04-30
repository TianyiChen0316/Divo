--stack_templates_q8-030_6644a0e2-a61f-30b0-8163-84f3d2db3cba.sql
--{"gen": "combine", "time": 0.2524526119232178, "template": "q8-030", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
question AS q2,
site AS site,
tag AS tag,
tag_question AS tq1,
tag_question AS tq2,
site AS s,
so_user AS u1,
tag AS t1
WHERE (site.site_name = 'dba' AND tag.name IN ('wpf', '.net', 'json') AND s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND u1.downvotes <= 10 AND u1.downvotes <= 100000 AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND c2.post_id = q2.id AND c2.site_id = q2.site_id AND pl.post_id_from = q1.id AND pl.post_id_to = q2.id AND pl.site_id = q1.site_id AND pl.site_id = q2.site_id AND pl.site_id = site.site_id AND tag.id = tq1.tag_id AND tag.id = tq2.tag_id AND tag.site_id = pl.site_id AND tag.site_id = tq1.site_id AND tag.site_id = tq1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq2.question_id = q2.id AND tq2.site_id = q2.site_id AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND tq1.tag_id = tq2.tag_id AND tq2.tag_id = t1.id AND tag.id = t1.id AND tq2.site_id = c2.site_id AND tq2.site_id = t1.site_id AND tq2.site_id = s.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = tag.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = t1.site_id AND c2.site_id = s.site_id AND c2.site_id = u1.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = tag.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND t1.site_id = site.site_id AND t1.site_id = tag.site_id AND t1.site_id = pl.site_id AND t1.site_id = q2.site_id AND t1.site_id = c1.site_id AND s.site_id = site.site_id AND s.site_id = tag.site_id AND s.site_id = pl.site_id AND s.site_id = q2.site_id AND s.site_id = c1.site_id AND u1.site_id = site.site_id AND u1.site_id = tag.site_id AND u1.site_id = pl.site_id AND u1.site_id = q2.site_id AND u1.site_id = c1.site_id AND q1.site_id = site.site_id AND q1.site_id = tag.site_id AND q1.site_id = q2.site_id AND site.site_id = tag.site_id AND site.site_id = q2.site_id AND site.site_id = tq1.site_id AND site.site_id = c1.site_id AND tag.site_id = q2.site_id AND tag.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND q2.site_id = tq1.site_id AND q2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND tq1.question_id = pl.post_id_from AND c1.post_id = pl.post_id_from AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND c1.date < c2.date)
