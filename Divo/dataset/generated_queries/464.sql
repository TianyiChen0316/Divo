--{"gen": "erase", "time": "/", "template": "generated-d516ccda-d0f7-4042-87a2-8c4976d16d31", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
info_type AS it,
info_type AS it2,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (it.info = 'genres' AND it2.info = 'release dates' AND kt.kind = 'movie' AND ci.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)
