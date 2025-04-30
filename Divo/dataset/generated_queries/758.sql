--{"gen": "combine", "time": "/", "template": "generated-51641f15-f5bf-4698-b0c5-a4bb79347aee", "dataset": "full_job", "rows": null}
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
char_name AS chn,
keyword AS k,
link_type AS lt,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
info_type AS it1,
info_type AS it2,
kind_type AS kt
WHERE (it.info = 'top 250 rank' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mc.note LIKE '%(co-production)%' AND t.production_year > 2010 AND ci.role_id = 2 AND k.keyword = 'sequel' AND lt.link LIKE '%follow%' AND mi.info IN ('Germany', 'German') AND it1.info = 'countries' AND it2.info = 'votes' AND kt.kind = 'movie' AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND chn.id = ci.person_role_id AND an.person_id = ci.person_id AND cn.id = chn.id AND mc.company_id = chn.id AND mc.company_id = ci.person_role_id AND ci.movie_id = mi_idx.movie_id AND lt.id = ml.link_type_id AND mk.keyword_id = k.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND t.id = ml.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND kt.id = t.kind_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND it2.id = it.id)
