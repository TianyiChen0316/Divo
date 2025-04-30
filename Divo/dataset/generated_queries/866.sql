--{"gen": "combine", "time": "/", "template": "generated-6301d9a1-79f1-46b1-b21a-e3a3f6c138a5", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM info_type AS it,
movie_companies AS mc,
movie_info_idx AS mi_idx,
title AS t,
cast_info AS ci,
char_name AS cn,
aka_name AS an,
complete_cast AS cc,
comp_cast_type AS cct1,
info_type AS it1,
movie_info AS mi,
movie_keyword AS mk,
info_type AS it2
WHERE (it.info = 'top 250 rank' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mc.note LIKE '%(co-production)%' AND t.production_year > 2010 AND ci.role_id = 2 AND cct1.kind = 'complete+verified' AND it1.info = 'mini biography' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND it2.info = 'rating' AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND mc.company_id = ci.person_role_id AND ci.movie_id = mi_idx.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND it1.id = mi.info_type_id AND cct1.id = cc.status_id AND mi_idx.info_type_id = it2.id AND mi.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND it2.id = it.id)
