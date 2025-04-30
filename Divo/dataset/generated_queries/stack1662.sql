--stack_templates_generated-69b4b21b-0e1e-43cf-992a-3c3bf04cb816_fafd7ee5-1fd1-3f83-990b-b5e547efccf4.sql
--{"gen": "erase", "time": 0.1000211238861084, "template": "generated-69b4b21b-0e1e-43cf-992a-3c3bf04cb816", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
site AS site,
tag_question AS tq2
WHERE (site.site_name = 'bicycles' AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND pl.site_id = site.site_id AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = c1.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = pl.site_id AND c2.site_id = c1.site_id AND q1.site_id = site.site_id AND site.site_id = c1.site_id AND pl.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND c1.date < c2.date)
