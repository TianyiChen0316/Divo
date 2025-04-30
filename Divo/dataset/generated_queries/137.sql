--{"gen": "erase", "time": "/", "template": "6d", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword,
min(n.name) AS actor_name
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
name AS n
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND n.name LIKE '%B%' AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id)
