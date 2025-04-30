--stack_templates_generated-ecf4055c-07e1-4d48-b10b-3ad30dcbe6d2_948c35e7-8743-316d-8059-fdbd8d63cb77.sql
--{"gen": "erase", "time": 0.22156691551208496, "template": "generated-ecf4055c-07e1-4d48-b10b-3ad30dcbe6d2", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
site AS site,
tag_question AS tq2
WHERE (site.site_name = 'magento' AND pl.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c1.site_id = pl.site_id AND c1.site_id = c2.site_id AND c1.site_id = tq2.site_id AND c1.site_id = site.site_id AND pl.site_id = c2.site_id AND pl.site_id = tq2.site_id AND c2.site_id = tq2.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND q1.site_id = site.site_id AND c1.post_id = pl.post_id_from AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND c1.date < c2.date)
