--{"gen": "combine", "time": "/", "template": "e9a", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(pi.info)
FROM person_info AS pi,
info_type AS it1,
info_type AS it2,
name AS n,
cast_info AS ci,
title AS t,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (it2.id = 3 AND mi.info ILIKE '%sci%' AND it1.info ILIKE 'birth date' AND pi.info ILIKE '%199%' AND mi_idx.info > '3.0' AND t.id = mi.movie_id AND t.id = ci.movie_id AND mi.movie_id = ci.movie_id AND mi.info_type_id = it2.id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it1.id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.person_id = pi.person_id)
