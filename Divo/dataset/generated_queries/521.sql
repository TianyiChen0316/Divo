--{"gen": "erase", "time": "/", "template": "generated-82383e3a-b267-409d-8d10-689c7a293736", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
info_type AS it,
movie_info AS mi
WHERE (it.id = 3 AND lower(mi.info) LIKE '%action%' AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id)
