--{"gen": "erase", "time": "/", "template": "generated-239562d7-4961-431b-808b-bfd225fefece", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS complete_hero_movie
FROM complete_cast AS cc,
comp_cast_type AS cct2,
cast_info AS ci,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
title AS t
WHERE (cct2.kind LIKE '%complete%' AND mi_idx.info > '8.0' AND t.production_year > 1950 AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND cct2.id = cc.status_id)
