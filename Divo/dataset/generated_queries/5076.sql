--{"gen": "erase", "time": "/", "template": "generated-93b41e4c-9cdc-462b-9f3c-c3775c29ec94", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS movie_company,
min(mi_idx.info) AS rating,
min(t.title) AS complete_euro_dark_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
company_name AS cn,
company_type AS ct,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
name AS n,
person_info AS pi
WHERE (cct1.kind = 'crew' AND cn.country_code <> '[us]' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND mc.note NOT LIKE '%(USA)%' AND mc.note NOT LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Germany', 'Swedish', 'German') AND mi_idx.info > '7.0' AND t.production_year > 2005 AND lower(pi.info) LIKE '%india%' AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND k.id = mk.keyword_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND cct1.id = cc.subject_id AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND mc.movie_id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi_idx.info_type_id = pi.info_type_id AND ci.person_id = pi.person_id)
