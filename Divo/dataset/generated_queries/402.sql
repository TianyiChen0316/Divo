--{"gen": "combine", "time": "/", "template": "generated-3ad11048-1187-4329-9ccb-2d6174889947", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year)
FROM cast_info AS ci,
title AS t,
info_type AS it,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
keyword AS k
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND it.info = 'rating' AND mi_idx.info > '2.0' AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND ci.movie_id = t.id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mi_idx.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND k.id = mk.keyword_id)
