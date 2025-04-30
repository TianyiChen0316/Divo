--{"gen": "combine", "time": "/", "template": "6f", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword,
min(n.name) AS actor_name,
min(t.title) AS hero_movie
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
name AS n,
title AS t,
movie_info AS mi
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND t.production_year > 2000 AND mi.info IN ('Bulgaria') AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND t.id = mi.movie_id AND mk.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id)
