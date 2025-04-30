--{"gen": "combine", "time": "/", "template": "generated-6b205e26-2c93-459b-a010-276c0d2a7482", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
aka_title AS at,
company_name AS cn,
movie_keyword AS mk,
complete_cast AS cc,
comp_cast_type AS cct2,
cast_info AS ci,
company_type AS ct,
info_type AS it,
movie_info_idx AS mi_idx
WHERE (mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND cn.country_code = '[ru]' AND cct2.kind LIKE '%complete%' AND ct.kind = 'production companies' AND mi_idx.info > '7.0' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND t.id = at.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND cn.id = mc.company_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct2.id = cc.status_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id AND t.id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mc.movie_id AND at.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id)
