--{"gen": "erase", "time": "/", "template": "e11b", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM info_type AS it2,
title AS t,
movie_info AS mi,
cast_info AS ci,
name AS n,
person_info AS pi
WHERE (lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%india%' AND lower(mi.info) LIKE '%usa%' AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND t.id = mi.movie_id AND pi.person_id = ci.person_id AND ci.movie_id = mi.movie_id)
