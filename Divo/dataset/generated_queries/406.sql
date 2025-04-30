--{"gen": "erase", "time": "/", "template": "e8b", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi
WHERE (lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id)
