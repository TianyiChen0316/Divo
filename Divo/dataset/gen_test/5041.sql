--{"gen": "combine", "time": "/", "template": "5a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
company_name AS cn,
info_type AS it1,
info_type AS it2,
kind_type AS kt,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND cn.country_code <> '[us]' AND it1.info = 'countries' AND it2.info = 'height' AND kt.kind IN ('movie', 'episode') AND mi_idx.info < '7.0' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND cn.id = mc.company_id)
