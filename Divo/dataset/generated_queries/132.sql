--{"gen": "combine", "time": "/", "template": "generated-c28630f4-72f2-47a0-a91d-49b8ff54a63c", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_based_on_book
FROM movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
complete_cast AS cc,
comp_cast_type AS cct1,
info_type AS it1,
keyword AS k,
kind_type AS kt,
movie_info AS mi
WHERE (mc.note IS NOT NULL AND t.production_year > 1950 AND cct1.kind = 'complete+verified' AND it1.info = 'release dates' AND k.keyword IN ('nerd', 'loner', 'alienation', 'dignity') AND kt.kind IN ('movie') AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:%200%' AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cct1.id = cc.status_id AND ml.movie_id = cc.movie_id AND ml.movie_id = mi.movie_id)
