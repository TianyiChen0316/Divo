--{"gen": "erase", "time": "/", "template": "generated-a31c7306-e21e-425b-b75b-5053e35f81fe", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(pi.info)
FROM person_info AS pi,
info_type AS it1,
name AS n,
cast_info AS ci,
title AS t,
movie_info AS mi,
movie_keyword AS mk,
movie_info_idx AS mi_idx
WHERE (lower(mi.info) LIKE '%documentary%' AND lower(it1.info) LIKE 'birth date' AND (lower(pi.info) LIKE '%189%' OR lower(pi.info) LIKE '188%' OR lower(pi.info) LIKE '187%' OR lower(pi.info) LIKE '186%' OR lower(pi.info) LIKE '185%' OR lower(pi.info) LIKE '184%') AND t.id = mi.movie_id AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it1.id AND t.id = mk.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND mi.info_type_id = mi_idx.info_type_id AND ci.movie_id = mi.movie_id AND ci.person_id = pi.person_id)
