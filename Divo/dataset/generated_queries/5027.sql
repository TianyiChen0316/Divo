--{"gen": "erase", "time": "/", "template": "generated-bb4bb83f-5b7b-4ba2-b0c7-d7b42005828b", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id)
