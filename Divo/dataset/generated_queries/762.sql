--{"gen": "erase", "time": "/", "template": "generated-2e58323a-3b3b-4a71-a41f-4d8d9f38abd3", "dataset": "full_job", "rows": null}
SELECT min(n.name),
min(t.title)
FROM info_type AS it1,
title AS t,
cast_info AS ci,
name AS n,
person_info AS pi,
info_type AS it,
keyword AS k,
movie_keyword AS mk,
movie_info AS mi,
movie_companies AS mc
WHERE (lower(it1.info) LIKE 'rating' AND lower(pi.info) LIKE '%usa%' AND it.info = 'release dates' AND k.keyword ILIKE '%love%' AND lower(mi.info) LIKE '%usa%' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note LIKE '%(co-production)%' OR mc.note LIKE '%(presents)%') AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND k.id = mk.keyword_id AND mi.info_type_id = it1.id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND t.id = mc.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mi.info_type_id = it.id AND it1.id = it.id AND ci.person_id = pi.person_id)
