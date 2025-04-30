--{"gen": "combine", "time": "/", "template": "generated-4429c478-0d0d-4060-b0fc-3557615723fc", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
info_type AS it,
movie_info_idx AS mi_idx,
title AS t,
complete_cast AS cc,
comp_cast_type AS cct2
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND it.info = 'rating' AND mi_idx.info < '7.0' AND t.production_year > 1990 AND cct2.kind LIKE '%complete%' AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct2.id = cc.status_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mk.movie_id AND cc.movie_id = mi_idx.movie_id)
