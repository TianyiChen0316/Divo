--{"gen": "combine", "time": "/", "template": "generated-2e58323a-3b3b-4a71-a41f-4d8d9f38abd3", "dataset": "full_job", "rows": null}
SELECT min(t.title)
FROM info_type AS it1,
movie_info_idx AS mi_idx,
title AS t,
cast_info AS ci,
person_info AS pi,
info_type AS it,
keyword AS k,
movie_keyword AS mk,
movie_info AS mi,
movie_companies AS mc,
company_name AS cn,
company_type AS ct,
info_type AS it2,
kind_type AS kt,
movie_info_idx AS miidx
WHERE (lower(it1.info) LIKE 'rating' AND lower(pi.info) LIKE '%usa%' AND (lower(mi_idx.info) LIKE '0%' OR lower(mi_idx.info) LIKE '1%' OR lower(mi_idx.info) LIKE '2%') AND it.info = 'top 250 rank' AND k.keyword ILIKE '%love%' AND lower(mi.info) LIKE '%usa%' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note LIKE '%(co-production)%' OR mc.note LIKE '%(presents)%') AND cn.country_code = '[us]' AND ct.kind = 'production companies' AND it2.info = 'release dates' AND kt.kind = 'movie' AND it1.id = mi_idx.info_type_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND mi.info_type_id = it1.id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.info_type_id = mi_idx.info_type_id AND mi.info_type_id = it.id AND it1.id = it.id AND ci.person_id = pi.person_id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.info_type_id = mi.info_type_id AND miidx.info_type_id = it1.id AND miidx.info_type_id = mi_idx.info_type_id AND miidx.info_type_id = it2.id AND it1.id = it2.id AND mi_idx.info_type_id = it2.id AND it.id = it2.id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id)
