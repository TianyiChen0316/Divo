--{"gen": "erase", "time": "/", "template": "e4a", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(miidx.info) AS rating,
min(t.title) AS hongkong_movie
FROM company_type AS ct,
info_type AS it,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t
WHERE (ct.kind = 'production companies' AND it.info = 'rating' AND kt.kind = 'movie' AND mi.movie_id = t.id AND kt.id = t.kind_id AND mc.movie_id = t.id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id)
