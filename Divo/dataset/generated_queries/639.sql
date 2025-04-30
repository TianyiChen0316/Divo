--{"gen": "erase", "time": "/", "template": "13a", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(miidx.info) AS rating,
min(t.title) AS german_movie
FROM info_type AS it,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t
WHERE (it.info = 'rating' AND it2.info = 'genres' AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND mc.movie_id = t.id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id)
