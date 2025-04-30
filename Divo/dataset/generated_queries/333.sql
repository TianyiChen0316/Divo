--{"gen": "combine", "time": "/", "template": "generated-48639081-fd8d-4977-908c-ef4489e559c7", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword,
min(n.name) AS actor_name,
min(t.title) AS hero_movie
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
name AS n,
title AS t,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND t.production_year > 2000 AND it1.info = 'genres' AND it2.info = 'release dates' AND mi.info = 'Horror' AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id)
