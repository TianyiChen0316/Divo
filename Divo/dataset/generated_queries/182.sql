--{"gen": "combine", "time": "/", "template": "6e", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS marvel_movie
FROM cast_info AS ci,
movie_keyword AS mk,
title AS t,
complete_cast AS cc,
comp_cast_type AS cct1,
company_type AS ct,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi
WHERE (t.production_year > 2000 AND cct1.kind = 'complete+verified' AND kt.kind IN ('movie') AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND ct.id = mc.company_type_id AND cct1.id = cc.status_id AND mc.movie_id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id)
