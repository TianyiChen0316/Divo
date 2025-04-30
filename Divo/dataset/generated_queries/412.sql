--{"gen": "combine", "time": "/", "template": "6d", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword,
min(n.name) AS actor_name,
min(t.title) AS hero_movie
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
name AS n,
title AS t,
person_info AS pi,
info_type AS it1,
info_type AS it2,
movie_info AS mi
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND n.name LIKE '%Downey%Robert%' AND t.production_year > 2000 AND it2.id = 3 AND lower(mi.info) LIKE '%documentary%' AND lower(it1.info) LIKE 'birth date' AND (lower(pi.info) LIKE '%189%' OR lower(pi.info) LIKE '188%' OR lower(pi.info) LIKE '187%' OR lower(pi.info) LIKE '186%' OR lower(pi.info) LIKE '185%' OR lower(pi.info) LIKE '184%') AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND t.id = mi.movie_id AND mi.info_type_id = it2.id AND n.id = pi.person_id AND pi.info_type_id = it1.id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND ci.person_id = pi.person_id)
