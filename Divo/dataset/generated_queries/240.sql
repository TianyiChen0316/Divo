--{"gen": "combine", "time": "/", "template": "generated-2e1a6581-75d7-4ecd-ad02-9d6c7480ccc7", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
company_type AS ct,
info_type AS it,
movie_info_idx AS mi_idx,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
person_info AS pi,
movie_link AS ml
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND ct.kind = 'production companies' AND it.info = 'top 250 rank' AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%india%' AND lower(it1.info) LIKE '%count%' AND lower(mi.info) LIKE '%usa%' AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ct.id = mc.company_type_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND pi.info_type_id = it2.id AND mi.info_type_id = it1.id AND t.id = mi.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = t.id AND ci.movie_id = mi.movie_id AND ci.person_id = pi.person_id AND ml.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
