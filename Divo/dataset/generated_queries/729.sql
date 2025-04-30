--{"gen": "combine", "time": "/", "template": "generated-76ae9792-57de-42b1-a051-922b8fae0bbd", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
aka_title AS at,
movie_info AS mi,
title AS t,
info_type AS it,
movie_info_idx AS mi_idx
WHERE (cn.country_code = '[jp]' AND mi.note LIKE '%internet%' AND t.production_year > 1990 AND it.info = 'rating' AND mi_idx.info > '5.0' AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
