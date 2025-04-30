--stack_templates_generated-4a1f5a55-b9bf-4e2a-9c70-f87bc886c9a3_ceefe8c5-0f7a-3c7a-981d-487d0994636f.sql
--{"gen": "erase", "time": 0.3679840564727783, "template": "generated-4a1f5a55-b9bf-4e2a-9c70-f87bc886c9a3", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
site AS site
WHERE (site.site_name = 'bicycles' AND pl.site_id = site.site_id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c1.site_id = pl.site_id AND c1.site_id = c2.site_id AND c1.site_id = site.site_id AND pl.site_id = c2.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND q1.site_id = site.site_id AND c1.post_id = pl.post_id_from AND c2.post_id = pl.post_id_to AND c1.date < c2.date)
