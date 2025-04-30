--{"gen": "combine", "time": "/", "template": "e3a", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS mainstream_movie
FROM movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
company_name AS cn,
info_type AS it1,
kind_type AS kt,
movie_keyword AS mk
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '7.0' AND t.production_year BETWEEN 2000 AND 2010 AND cn.country_code <> '[pl]' AND it1.info = 'countries' AND kt.kind IN ('movie', 'episode') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND kt.id = t.kind_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id)
