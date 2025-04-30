--{"gen": "erase", "time": "/", "template": "generated-94c7a505-293f-4538-a8cd-97bc7bc775ca", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS mainstream_movie
FROM movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
movie_keyword AS mk,
company_type AS ct,
info_type AS it,
movie_info_idx AS miidx
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '3.0' AND t.production_year BETWEEN 2000 AND 2010 AND ct.kind = 'production companies' AND it.info = 'rating' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id)
