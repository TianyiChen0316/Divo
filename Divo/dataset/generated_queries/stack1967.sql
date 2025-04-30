--stack_templates_q8-030_fa103422-9c18-3c1d-ac4a-41143b76564d.sql
--{"gen": "erase", "time": 0.719123363494873, "template": "q8-030", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
site AS site,
tag_question AS tq1,
tag_question AS tq2
WHERE (site.site_name = 'scifi' AND pl.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND tq1.site_id = q1.site_id AND tq1.question_id = q1.id AND tq2.tag_id = tq1.tag_id AND c1.site_id = pl.site_id AND c1.site_id = c2.site_id AND c1.site_id = tq2.site_id AND c1.site_id = tq1.site_id AND c1.site_id = site.site_id AND pl.site_id = c2.site_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND c2.site_id = tq2.site_id AND c2.site_id = q1.site_id AND c2.site_id = tq1.site_id AND c2.site_id = site.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = site.site_id AND q1.site_id = site.site_id AND tq1.site_id = site.site_id AND c1.post_id = tq1.question_id AND c1.post_id = pl.post_id_from AND tq1.question_id = pl.post_id_from AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND c1.date < c2.date)
