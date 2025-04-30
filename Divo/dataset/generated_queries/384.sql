--{"gen": "erase", "time": "/", "template": "generated-c0a4fcc1-da0f-40f8-b7fe-b5eaf40a0d94", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS marvel_movie
FROM cast_info AS ci,
movie_keyword AS mk,
title AS t,
complete_cast AS cc,
movie_companies AS mc,
movie_info AS mi
WHERE (t.production_year BETWEEN 2007 AND 2010 AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id)
