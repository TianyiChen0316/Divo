--{"gen": "erase", "time": "/", "template": "generated-58f6b324-514b-4f82-b337-b45573bd563f", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
complete_cast AS cc,
cast_info AS ci
WHERE (k.keyword LIKE '%sequel%' AND mi_idx.info > '2.0' AND t.production_year > 1990 AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mk.movie_id AND cc.movie_id = mi_idx.movie_id)
