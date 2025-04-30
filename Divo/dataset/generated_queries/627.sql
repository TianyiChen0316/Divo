--{"gen": "erase", "time": "/", "template": "generated-d240bfaf-f121-44b9-81e2-40ef82772df6", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS budget,
min(t.title) AS unsuccsessful_movie
FROM company_name AS cn,
info_type AS it1,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
cast_info AS ci,
movie_keyword AS mk,
movie_info_idx AS miidx
WHERE (cn.country_code = '[us]' AND it1.info = 'budget' AND it2.info = 'height' AND t.production_year > 2000 AND (t.title LIKE 'Birdemic%' OR t.title LIKE '%Movie%') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id AND t.id = mc.movie_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mi_idx.movie_id)
