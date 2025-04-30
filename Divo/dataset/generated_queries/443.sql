--{"gen": "combine", "time": "/", "template": "5b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS american_vhs_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
company_name AS cn,
info_type AS it1,
info_type AS it2,
kind_type AS kt,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (mc.note LIKE '%(VHS)%' AND mc.note LIKE '%(USA)%' AND mc.note LIKE '%(1994)%' AND mi.info IN ('USA', 'America') AND t.production_year > 2010 AND cn.country_code <> '[pl]' AND it1.info = 'top 250 rank' AND it2.info = 'rating' AND kt.kind IN ('movie', 'episode') AND mi_idx.info < '8.5' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND cn.id = mc.company_id)
