--{"gen": "combine", "time": "/", "template": "generated-311b150b-8408-400a-85e0-017ada7b859e", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
movie_keyword AS mk,
cast_info AS ci,
company_name AS cn,
info_type AS it1,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
info_type AS it,
keyword AS k
WHERE (ci.role_id = 2 AND cn.country_code = '[us]' AND it1.info = 'genres' AND mi.info IN ('Drama', 'Horror') AND mi_idx.info < '7.0' AND t.production_year BETWEEN 2005 AND 2008 AND it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mc.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND t.id = mc.movie_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id)
