--{"gen": "erase", "time": "/", "template": "12b", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS budget,
min(t.title) AS unsuccsessful_movie
FROM company_name AS cn,
info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t
WHERE (cn.country_code = '[us]' AND it1.info = 'rating' AND t.production_year BETWEEN 2008 AND 2014 AND (t.title LIKE 'Birdemic%' OR t.title LIKE '%Movie%') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND t.id = mc.movie_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
