--{"gen": "erase", "time": "/", "template": "generated-2a03cdf5-5040-4646-a992-8d9ee393d1ca", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_info AS mi,
movie_keyword AS mk,
title AS t,
movie_companies AS mc,
movie_info_idx AS mi_idx,
cast_info AS ci,
role_type AS rt
WHERE (mi.info IN ('Bulgaria') AND t.production_year > 2010 AND mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi_idx.info < '8.5' AND ci.note LIKE '%(uncredited)%' AND rt.role = 'actor' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND rt.id = ci.role_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
