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
keyword AS k,
movie_info AS mi
WHERE (mi_idx.info > '3.0' AND t.production_year > 2008 AND cn.country_code = '[us]' AND rt.role = 'costume designer' AND k.keyword LIKE '%sequel%' AND mi.info IN ('Bulgaria') AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND t.id = mi.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id)
