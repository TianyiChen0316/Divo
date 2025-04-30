--{"gen": "combine", "time": "/", "template": "e6b", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc
WHERE (mi_idx.info > '3.0' AND t.production_year > 2008 AND k.keyword = 'character-name-in-title' AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = t.id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id)
