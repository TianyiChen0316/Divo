--{"gen": "combine", "time": "/", "template": "generated-3dd84907-1e24-4d49-8af1-2f2b9701e387", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t
WHERE (k.keyword = 'character-name-in-title' AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info < '8.5' AND t.production_year BETWEEN 2000 AND 2010 AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id)
