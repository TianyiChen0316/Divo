--{"gen": "erase", "time": "/", "template": "3b", "dataset": "full_job", "rows": null}
SELECT *
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk
WHERE (k.keyword LIKE '%sequel%' AND mi.info IN ('Bulgaria') AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id)
