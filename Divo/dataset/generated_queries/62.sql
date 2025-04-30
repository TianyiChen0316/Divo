--{"gen": "erase", "time": "/", "template": "13c", "dataset": "full_job", "rows": null}
SELECT min(miidx.info) AS rating
FROM company_type AS ct,
info_type AS it,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (ct.kind = 'production companies' AND it.info = 'rating' AND it2.info = 'release dates' AND it2.id = mi.info_type_id AND ct.id = mc.company_type_id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id)
