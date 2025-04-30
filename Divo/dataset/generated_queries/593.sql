--{"gen": "erase", "time": "/", "template": "e8a", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi
WHERE (k.keyword ILIKE '%love%' AND mi.info ILIKE '%romance%' AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id)
