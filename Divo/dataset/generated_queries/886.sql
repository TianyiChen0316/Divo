--{"gen": "erase", "time": "/", "template": "generated-2a03cdf5-5040-4646-a992-8d9ee393d1ca", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_info AS mi,
movie_keyword AS mk,
info_type AS it2,
movie_companies AS mc,
movie_info_idx AS mi_idx,
cast_info AS ci
WHERE (mi.info IN ('Bulgaria') AND it2.info = 'release dates' AND mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi_idx.info < '3.0' AND ci.note LIKE '%(uncredited)%' AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND it2.id = mi_idx.info_type_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
