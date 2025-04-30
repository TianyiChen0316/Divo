--{"gen": "erase", "time": "/", "template": "generated-374e2d0e-57c6-424b-87e7-00bc7490013e", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
title AS t,
info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (t.production_year > 2000 AND it1.info = 'top 250 rank' AND mc.note LIKE '%(VHS)%' AND mi.info IN ('Horror', 'Thriller') AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND it1.id = mi.info_type_id AND t.id = mc.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id)
