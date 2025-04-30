--{"gen": "erase", "time": "/", "template": "generated-fbad8d73-7b82-4395-bf57-d8620aa461da", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS mainstream_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
keyword AS k,
movie_keyword AS mk,
kind_type AS kt,
movie_info_idx AS miidx,
complete_cast AS cc,
cast_info AS ci,
name AS n
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND t.production_year BETWEEN 2000 AND 2010 AND k.keyword LIKE '%sequel%' AND kt.kind = 'movie' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mi.movie_id = mc.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND mc.movie_id = mk.movie_id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND n.id = ci.person_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id)
