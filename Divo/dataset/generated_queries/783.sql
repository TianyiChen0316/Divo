--{"gen": "combine", "time": "/", "template": "generated-a4fcce20-663b-47c7-b5b7-bb3915a219f7", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS western_dark_production
FROM kind_type AS kt,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
name AS n,
person_info AS pi,
company_name AS cn,
company_type AS ct,
info_type AS it2,
movie_companies AS mc,
movie_info_idx AS mi_idx,
keyword AS k
WHERE (kt.kind = 'movie' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year > 2010 AND (t.title LIKE '%murder%' OR t.title LIKE '%Murder%' OR t.title LIKE '%Mord%') AND (pi.info ILIKE '%uk%' OR pi.info ILIKE '%spain%' OR pi.info ILIKE '%germany%' OR pi.info ILIKE '%italy%' OR pi.info ILIKE '%croatia%' OR pi.info ILIKE '%algeria%' OR pi.info ILIKE '%south%' OR pi.info ILIKE '%austria%' OR pi.info ILIKE '%hungary%') AND cn.country_code = '[us]' AND ct.kind = 'production companies' AND it2.info = 'rating' AND mi_idx.info > '8.0' AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND mi_idx.info_type_id = it2.id AND t.id = mc.movie_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id)
