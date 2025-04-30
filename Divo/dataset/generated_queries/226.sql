--{"gen": "erase", "time": "/", "template": "generated-5e34a821-df4f-4c9e-96d9-42ba0d5473e0", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS from_company,
min(mc.note) AS production_note
FROM company_name AS cn,
company_type AS ct,
keyword AS k,
link_type AS lt,
movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (cn.country_code <> '[pl]' AND ct.kind <> 'production companies' AND ct.kind IS NOT NULL AND k.keyword IN ('sequel', 'revenge', 'based-on-novel') AND mc.note IS NOT NULL AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info < '3.0' AND lt.id = ml.link_type_id AND mk.keyword_id = k.id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id)
