--{"gen": "combine", "time": "/", "template": "e8a", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (it.id = 3 AND k.keyword ILIKE '%love%' AND mi.info ILIKE '%romance%' AND mi_idx.info > '2.0' AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mi.movie_id)
