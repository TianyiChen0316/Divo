--{"gen": "erase", "time": "/", "template": "generated-7ada5d14-3d44-470a-836f-c2080cbe193e", "dataset": "full_job", "rows": null}
SELECT min(miidx.info) AS rating,
min(t.title) AS movie
FROM info_type AS it,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t
WHERE (it.info = 'genres' AND kt.kind = 'movie' AND mi.movie_id = t.id AND kt.id = t.kind_id AND mc.movie_id = t.id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id)
