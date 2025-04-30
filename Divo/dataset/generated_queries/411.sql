--{"gen": "erase", "time": "/", "template": "4b", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM info_type AS it,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (it.info = 'rating' AND k.keyword ILIKE '%love%' AND mi_idx.info > '9.0' AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id)
