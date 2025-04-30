--{"gen": "combine", "time": "/", "template": "12b", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS budget,
min(t.title) AS unsuccsessful_movie
FROM company_name AS cn,
company_type AS ct,
info_type AS it1,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
kind_type AS kt,
movie_keyword AS mk
WHERE (cn.country_code = '[us]' AND ct.kind IS NOT NULL AND (ct.kind = 'production companies' OR ct.kind = 'distributors') AND it1.info = 'budget' AND it2.info = 'bottom 10 rank' AND t.production_year > 2000 AND (t.title LIKE 'Birdemic%' OR t.title LIKE '%Movie%') AND kt.kind = 'movie' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id AND t.id = mc.movie_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND kt.id = t.kind_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mk.movie_id)
