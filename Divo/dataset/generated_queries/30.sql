--{"gen": "erase", "time": "/", "template": "generated-82383e3a-b267-409d-8d10-689c7a293736", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi
WHERE (lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id)
