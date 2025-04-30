--{"gen": "combine", "time": "/", "template": "generated-b2a6e24f-6232-4686-9583-0562349818c7", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS western_dark_production
FROM info_type AS it1,
info_type AS it2,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
company_name AS cn,
company_type AS ct,
keyword AS k,
movie_companies AS mc,
movie_info_idx AS mii,
cast_info AS ci,
name AS n,
person_info AS pi
WHERE (it1.info = 'countries' AND it2.info = 'height' AND kt.kind = 'movie' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info > '6.0' AND t.production_year > 2010 AND (t.title LIKE '%murder%' OR t.title LIKE '%Murder%' OR t.title LIKE '%Mord%') AND cn.country_code <> '[us]' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND mc.note NOT LIKE '%(USA)%' AND mc.note LIKE '%(Japan)%' AND pi.info ILIKE '%usa%' AND (mii.info ILIKE '8%' OR mii.info ILIKE '9%' OR mii.info ILIKE '10%') AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND t.id = mc.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND it1.id = mii.info_type_id AND mii.movie_id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND pi.info_type_id = it2.id AND mi.info_type_id = mii.info_type_id AND mi_idx.info_type_id = pi.info_type_id)
