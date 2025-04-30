--{"gen": "combine", "time": "/", "template": "e9b", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(pi.info)
FROM person_info AS pi,
info_type AS it1,
info_type AS it2,
name AS n,
cast_info AS ci,
title AS t,
movie_info AS mi,
company_type AS ct,
info_type AS it,
movie_companies AS mc
WHERE (it2.id = 3 AND lower(mi.info) LIKE '%documentary%' AND lower(it1.info) LIKE 'birth date' AND (lower(pi.info) LIKE '%189%' OR lower(pi.info) LIKE '188%' OR lower(pi.info) LIKE '187%' OR lower(pi.info) LIKE '186%' OR lower(pi.info) LIKE '185%' OR lower(pi.info) LIKE '184%') AND ct.kind = 'production companies' AND mc.note NOT LIKE '%(USA)%' AND mc.note LIKE '%(1994)%' AND mc.note LIKE '%(1994)%' AND t.id = mi.movie_id AND mi.info_type_id = it2.id AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it1.id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mc.movie_id AND ci.person_id = pi.person_id AND it2.id = it.id)
