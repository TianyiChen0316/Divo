--{"gen": "combine", "time": "/", "template": "generated-cfe1a298-a421-4b2b-a29a-c13da2ac4e2f", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS mainstream_movie
FROM info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
name AS n,
aka_name AS an,
company_name AS cn
WHERE (it1.info = 'bottom 10 rank' AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '7.0' AND t.production_year > 1990 AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND cn.country_code = '[us]' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND an.person_id = n.id AND mc.company_id = cn.id AND an.person_id = ci.person_id)
