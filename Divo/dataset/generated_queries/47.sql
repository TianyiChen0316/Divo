--{"gen": "erase", "time": "/", "template": "generated-1b27d0ea-9c6c-4d53-8809-f880772010b8", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM info_type AS it,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
movie_companies AS mc,
movie_info AS mi
WHERE (it.info = 'rating' AND mi_idx.info > '5.0' AND t.production_year > 2005 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id)
