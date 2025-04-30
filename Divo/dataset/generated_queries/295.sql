--{"gen": "erase", "time": "/", "template": "generated-d037118e-396d-49a3-92eb-3a3600a7b3d5", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_downey_ironman_movie
FROM complete_cast AS cc,
comp_cast_type AS cct2,
cast_info AS ci,
kind_type AS kt,
movie_keyword AS mk,
title AS t,
company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
movie_link AS ml
WHERE (cct2.kind LIKE '%complete%' AND kt.kind = 'movie' AND t.production_year > 2000 AND ct.kind = 'production companies' AND mc.note IS NULL AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct2.id = cc.status_id AND ml.movie_id = t.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mi.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id)
