--{"gen": "combine", "time": "/", "template": "generated-e2714f78-353d-477b-af8c-ad9976125121", "dataset": "full_job", "rows": null}
SELECT min(at.title) AS aka_title,
min(t.title) AS internet_movie_title
FROM aka_title AS at,
company_name AS cn,
company_type AS ct,
info_type AS it1,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
info_type AS it,
movie_info_idx AS mi_idx,
cast_info AS ci,
name AS n
WHERE (cn.country_code = '[us]' AND it1.info = 'release dates' AND mi.note LIKE '%internet%' AND t.production_year > 1990 AND it.info = 'rating' AND mi_idx.info > '5.0' AND n.name LIKE '%Downey%Robert%' AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND mc.movie_id = ci.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
