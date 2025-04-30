--stack_templates_generated-8d873b7a-bd02-4d5f-8c25-4d11711957bb_3d5ccdbf-5243-3393-abf9-7dfc8298f914.sql
--{"gen": "combine", "time": 0.22100114822387695, "template": "generated-8d873b7a-bd02-4d5f-8c25-4d11711957bb", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
site AS site,
tag_question AS tq1,
tag_question AS tq2,
tag_question AS tag_question,
site AS s,
account AS account,
site AS s1,
so_user AS u1,
tag AS t1
WHERE (site.site_name = 'ai' AND s.site_name IN ('askubuntu', 'math') AND s1.site_name = 'chemistry' AND t1.name IN ('copyright', 'sunyata') AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND pl.site_id = site.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tag_question.site_id = site.site_id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = c1.post_id AND tq1.question_id = pl.post_id_from AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND tag_question.site_id = c1.site_id AND q1.site_id = site.site_id AND site.site_id = tq1.site_id AND site.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND tq2.site_id = s.site_id AND c2.site_id = s.site_id AND s.site_id = tag_question.site_id AND s.site_id = site.site_id AND s.site_id = pl.site_id AND s.site_id = c1.site_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND tq2.site_id = t1.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND c2.site_id = t1.site_id AND c2.site_id = u1.site_id AND c2.site_id = s1.site_id AND t1.site_id = s.site_id AND t1.site_id = u1.site_id AND t1.site_id = tag_question.site_id AND t1.site_id = q1.site_id AND t1.site_id = site.site_id AND t1.site_id = pl.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND s.site_id = u1.site_id AND s.site_id = s1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = site.site_id AND u1.site_id = pl.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND tag_question.site_id = s1.site_id AND site.site_id = s1.site_id AND pl.site_id = s1.site_id AND s1.site_id = c1.site_id AND tq2.tag_id = t1.id AND tag_question.tag_id = t1.id AND c1.date < c2.date)
