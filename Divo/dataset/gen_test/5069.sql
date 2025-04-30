--{"gen": "combine", "time": "/", "template": "generated-c25ed4ee-2807-455a-b35f-1a29ee72960d", "dataset": "full_job", "rows": null}
SELECT min(n.name),
min(t.title)
FROM info_type AS it2,
movie_info_idx AS mi_idx,
title AS t,
cast_info AS ci,
name AS n,
person_info AS pi,
complete_cast AS cc,
char_name AS chn,
kind_type AS kt,
movie_keyword AS mk
WHERE (lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%usa%' AND (lower(mi_idx.info) LIKE '0%' OR lower(mi_idx.info) LIKE '1%' OR lower(mi_idx.info) LIKE '2%') AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND kt.kind = 'movie' AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND ci.movie_id = mi_idx.movie_id AND pi.person_id = ci.person_id AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND cc.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id)
