--{"gen": "erase", "time": "/", "template": "generated-1e129812-4ddd-4c2e-b2bf-347d9c1dda5a", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
movie_keyword AS mk,
cast_info AS ci,
info_type AS it1,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
keyword AS k
WHERE (ci.role_id = 2 AND it1.info = 'genres' AND mi.info IN ('Drama', 'Horror') AND mi_idx.info < '7.0' AND t.production_year BETWEEN 2005 AND 2008 AND k.keyword LIKE '%sequel%' AND mc.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id)
