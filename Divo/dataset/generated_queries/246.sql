--{"gen": "combine", "time": "/", "template": "generated-bad6f2ca-d36b-4983-a2d1-467f31f9ece5", "dataset": "full_job", "rows": null}
SELECT min(miidx.info) AS rating,
min(t.title) AS hongkong_movie
FROM info_type AS it,
movie_companies AS mc,
movie_info_idx AS miidx,
title AS t,
cast_info AS ci,
movie_keyword AS mk,
aka_title AS at,
movie_info AS mi,
complete_cast AS cc
WHERE (it.info = 'rating' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND mc.movie_id = t.id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND miidx.movie_id = mc.movie_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND at.movie_id = ci.movie_id AND t.id = mi.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND t.id = at.movie_id AND at.movie_id = cc.movie_id AND miidx.movie_id = at.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = cc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi.movie_id)
