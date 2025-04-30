--{"gen": "combine", "time": "/", "template": "generated-b6f70315-ce95-426f-a0fd-1b5587851e69", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(miidx.info) AS rating,
min(t.title) AS hongkong_movie
FROM info_type AS it,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t,
cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
info_type AS it1,
info_type AS it2,
movie_info_idx AS mi_idx
WHERE (it.info = 'rating' AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND it1.info = 'height' AND it2.info = 'release dates' AND mi.movie_id = t.id AND mc.movie_id = t.id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id)
