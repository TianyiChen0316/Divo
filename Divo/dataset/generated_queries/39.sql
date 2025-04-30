--{"gen": "erase", "time": "/", "template": "generated-7db77ccd-fd34-48af-ba32-429177de9eae", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
aka_title AS at,
movie_keyword AS mk,
complete_cast AS cc,
comp_cast_type AS cct2,
cast_info AS ci
WHERE (mc.note LIKE '%(Japan)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND cct2.kind LIKE 'complete%' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND t.id = at.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct2.id = cc.status_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id)
