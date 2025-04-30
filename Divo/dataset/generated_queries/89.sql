--{"gen": "erase", "time": "/", "template": "6b", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword,
min(t.title) AS hero_movie
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
title AS t
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND t.production_year > 2014 AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id)
