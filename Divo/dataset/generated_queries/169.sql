--{"gen": "combine", "time": "/", "template": "generated-bb05d7e9-d231-4c63-b935-382c62c55dbc", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS complete_hero_movie
FROM complete_cast AS cc,
comp_cast_type AS cct2,
cast_info AS ci,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
title AS t,
company_type AS ct,
link_type AS lt,
movie_companies AS mc,
movie_link AS ml
WHERE (cct2.kind LIKE '%complete%' AND mi_idx.info > '8.0' AND t.production_year BETWEEN 1950 AND 2010 AND ct.kind <> 'production companies' AND ct.kind IS NOT NULL AND mc.note IS NOT NULL AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND cct2.id = cc.status_id AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = cc.movie_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id)
