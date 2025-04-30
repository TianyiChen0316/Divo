--{"gen": "combine", "time": "/", "template": "generated-708f2dd3-d5c1-4cd8-8602-bf0f81cfa073", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
role_type AS rt,
info_type AS it1,
info_type AS it2,
name AS n,
person_info AS pi
WHERE (mi_idx.info > '3.0' AND t.production_year > 2008 AND cn.country_code = '[us]' AND rt.role = 'costume designer' AND lower(it1.info) LIKE 'rating' AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%usa%' AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND it1.id = mi_idx.info_type_id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND ci.person_id = pi.person_id)
