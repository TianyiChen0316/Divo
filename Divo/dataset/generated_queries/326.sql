--{"gen": "erase", "time": "/", "template": "generated-d98a0b84-28fa-4c56-8d7e-b134cb09a7dc", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi,
movie_companies AS mc
WHERE (lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND mc.movie_id = t.id AND mc.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id)
