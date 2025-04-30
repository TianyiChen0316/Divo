--{"gen": "combine", "time": "/", "template": "e8b", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi,
info_type AS it1,
info_type AS it2,
kind_type AS kt,
movie_info_idx AS mi_idx
WHERE (it.id = 3 AND lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND it1.info = 'countries' AND it2.info = 'rating' AND kt.kind = 'movie' AND mi_idx.info > '2.0' AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND kt.id = t.kind_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND it1.id = it.id AND mk.movie_id = mi.movie_id)
