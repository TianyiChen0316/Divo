--{"gen": "combine", "time": "/", "template": "generated-03868162-bc27-4b55-8999-d8c657e8ff58", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(pi.info)
FROM person_info AS pi,
name AS n,
cast_info AS ci,
title AS t,
movie_info AS mi,
complete_cast AS cc,
char_name AS chn,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
movie_companies AS mc
WHERE (lower(mi.info) LIKE '%documentary%' AND (lower(pi.info) LIKE '%189%' OR lower(pi.info) LIKE '188%' OR lower(pi.info) LIKE '187%' OR lower(pi.info) LIKE '186%' OR lower(pi.info) LIKE '185%' OR lower(pi.info) LIKE '184%') AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND mi_idx.info < '3.0' AND t.id = mi.movie_id AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.movie_id = mi.movie_id AND pi.person_id = ci.person_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id AND mk.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.info_type_id = mi_idx.info_type_id)
