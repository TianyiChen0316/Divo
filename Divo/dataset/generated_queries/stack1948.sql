--stack_templates_generated-69b4b21b-0e1e-43cf-992a-3c3bf04cb816_35076d63-8491-38ce-83aa-9ecfa198467f.sql
--{"gen": "combine", "time": 1.1367695331573486, "template": "generated-69b4b21b-0e1e-43cf-992a-3c3bf04cb816", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
site AS site,
tag_question AS tq1,
tag_question AS tq2,
tag_question AS tag_question,
so_user AS u1,
tag AS t1
WHERE (site.site_name = 'hsm' AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND u1.downvotes >= 10 AND u1.downvotes >= 0 AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND pl.site_id = site.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tag_question.site_id = site.site_id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = c1.post_id AND tq1.question_id = pl.post_id_from AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND tag_question.site_id = c1.site_id AND q1.site_id = site.site_id AND site.site_id = tq1.site_id AND site.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND tq2.tag_id = t1.id AND tag_question.tag_id = t1.id AND tq2.site_id = t1.site_id AND tq2.site_id = u1.site_id AND c2.site_id = t1.site_id AND c2.site_id = u1.site_id AND t1.site_id = tag_question.site_id AND t1.site_id = site.site_id AND t1.site_id = pl.site_id AND t1.site_id = c1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = site.site_id AND u1.site_id = pl.site_id AND u1.site_id = c1.site_id AND c1.date < c2.date)
