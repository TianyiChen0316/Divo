--{"gen": "erase", "time": "/", "template": "e8b", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
info_type AS it,
movie_info AS mi
WHERE (it.id = 3 AND lower(mi.info) LIKE '%action%' AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id)
