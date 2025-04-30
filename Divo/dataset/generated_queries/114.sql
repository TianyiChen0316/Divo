--{"gen": "erase", "time": "/", "template": "12c", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS mainstream_movie
FROM company_type AS ct,
info_type AS it1,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t
WHERE (ct.kind = 'production companies' AND it1.info = 'genres' AND it2.info = 'rating' AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '5.0' AND t.production_year BETWEEN 2000 AND 2010 AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id AND t.id = mc.movie_id AND ct.id = mc.company_type_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
