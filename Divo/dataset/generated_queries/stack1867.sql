--stack_templates_q8-030_59d7c116-41df-3f2a-a9db-199fd9b37ea1.sql
--{"gen": "combine", "time": 0.3009014129638672, "template": "q8-030", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
site AS site,
tag_question AS tq1,
tag_question AS tq2,
site AS s,
so_user AS u1,
tag AS t1,
account AS account,
so_user AS u2,
tag AS t2
WHERE (site.site_name = 'german' AND s.site_name IN ('askubuntu', 'math') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND u1.downvotes >= 10 AND u1.downvotes <= 10 AND t2.name = '16.04' AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND pl.site_id = site.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u2.account_id = account.id AND tq2.site_id = t2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = u2.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND tq2.site_id = c2.site_id AND tq2.site_id = t1.site_id AND tq2.site_id = s.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = t1.site_id AND c2.site_id = s.site_id AND c2.site_id = t2.site_id AND c2.site_id = u1.site_id AND c2.site_id = q1.site_id AND c2.site_id = u2.site_id AND c2.site_id = site.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND t1.site_id = t2.site_id AND t1.site_id = u2.site_id AND t1.site_id = site.site_id AND t1.site_id = pl.site_id AND t1.site_id = c1.site_id AND s.site_id = t2.site_id AND s.site_id = u2.site_id AND s.site_id = site.site_id AND s.site_id = pl.site_id AND s.site_id = c1.site_id AND t2.site_id = u1.site_id AND t2.site_id = q1.site_id AND t2.site_id = site.site_id AND t2.site_id = pl.site_id AND t2.site_id = tq1.site_id AND t2.site_id = c1.site_id AND u1.site_id = u2.site_id AND u1.site_id = site.site_id AND u1.site_id = pl.site_id AND u1.site_id = c1.site_id AND q1.site_id = u2.site_id AND q1.site_id = site.site_id AND u2.site_id = site.site_id AND u2.site_id = pl.site_id AND u2.site_id = tq1.site_id AND u2.site_id = c1.site_id AND site.site_id = tq1.site_id AND site.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = pl.post_id_from AND tq1.question_id = c1.post_id AND pl.post_id_from = c1.post_id AND tq2.tag_id = t1.id AND tq2.tag_id = tq1.tag_id AND t1.id = t2.id AND t2.id = tq1.tag_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND c1.date < c2.date)
