--{"gen": "combine", "time": "/", "template": "e5a", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
movie_companies AS mc,
title AS t,
info_type AS it,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year > 2008 AND it.info = 'rating' AND kt.kind = 'movie' AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND mi.movie_id = t.id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id)
