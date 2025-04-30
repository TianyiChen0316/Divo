--{"gen": "combine", "time": "/", "template": "generated-37aaf9de-3fc3-4ccf-b1e9-8d3cc7344cbb", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
movie_info_idx AS mi_idx,
title AS t,
cast_info AS ci,
role_type AS rt,
movie_keyword AS mk,
name AS n,
info_type AS it2,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (ct.kind = 'production companies' AND it.info = 'bottom 10 rank' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year > 2000 AND ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND rt.role = 'actor' AND n.name LIKE 'B%' AND it2.info = 'release dates' AND kt.kind = 'movie' AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND rt.id = ci.role_id AND ci.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND t.id = mk.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND miidx.info_type_id = mi_idx.info_type_id AND miidx.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
