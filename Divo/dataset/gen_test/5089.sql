--{"gen": "erase", "time": "/", "template": "generated-8cc629d0-dbd7-4e93-9315-e7b58b8ce01c", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS budget,
min(t.title) AS unsuccsessful_movie
FROM info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
cast_info AS ci,
movie_keyword AS mk,
movie_info_idx AS miidx,
kind_type AS kt,
aka_title AS at
WHERE (it1.info = 'height' AND t.production_year > 2000 AND (t.title LIKE 'Birdemic%' OR t.title LIKE '%Movie%') AND kt.kind = 'movie' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mi_idx.movie_id AND kt.id = t.kind_id AND t.id = at.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND miidx.movie_id = at.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mi_idx.movie_id)
