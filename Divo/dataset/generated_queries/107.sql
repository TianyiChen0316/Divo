--{"gen": "erase", "time": "/", "template": "e8a", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi
WHERE (it.id = 3 AND k.keyword ILIKE '%love%' AND mi.info ILIKE '%romance%' AND it.id = mi.info_type_id AND mk.keyword_id = k.id AND mi.movie_id = mk.movie_id)
