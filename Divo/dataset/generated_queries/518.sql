--{"gen": "combine", "time": "/", "template": "4c", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
aka_title AS at,
company_name AS cn,
company_type AS ct,
info_type AS it1,
movie_companies AS mc,
movie_info AS mi
WHERE (mi_idx.info > '2.0' AND t.production_year > 1990 AND cn.country_code = '[us]' AND it1.info = 'release dates' AND mi.note LIKE '%internet%' AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
