--{"gen": "combine", "time": "/", "template": "generated-42eb1870-7aa2-4b66-a489-6fd146d5c604", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
movie_companies AS mc,
title AS t,
info_type AS it,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS miidx,
company_name AS cn,
info_type AS it1,
info_type AS it2,
movie_info_idx AS mi_idx
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year > 2008 AND it.info = 'rating' AND kt.kind = 'movie' AND cn.country_code = '[us]' AND it1.info = 'release dates' AND it2.info = 'bottom 10 rank' AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND mi.movie_id = t.id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id AND cn.id = mc.company_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND miidx.movie_id = mi_idx.movie_id)
