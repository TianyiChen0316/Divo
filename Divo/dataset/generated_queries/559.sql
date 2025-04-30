--{"gen": "erase", "time": "/", "template": "generated-12f8020a-114c-49c8-a070-f1fa2747d0a7", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS drama_horror_movie
FROM movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t
WHERE (mi.info IN ('Drama', 'Horror') AND mi_idx.info > '8.0' AND t.production_year BETWEEN 1980 AND 1995 AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
