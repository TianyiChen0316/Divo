--{"gen": "combine", "time": "/", "template": "generated-dca5cc8f-4309-4b63-bbce-beebf21efa65", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword,
min(t.title) AS hero_movie
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
title AS t,
movie_info AS mi
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND t.production_year BETWEEN 1980 AND 1995 AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi.movie_id AND mk.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id)
