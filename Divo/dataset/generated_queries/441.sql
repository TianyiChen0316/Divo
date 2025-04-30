--{"gen": "combine", "time": "/", "template": "generated-03cd0071-4d59-4e93-bd7e-a0176b9d3c31", "dataset": "full_job", "rows": null}
SELECT *
FROM keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
info_type AS it,
movie_info AS mi
WHERE (k.keyword = 'character-name-in-title' AND it.id = 3 AND lower(mi.info) LIKE '%action%' AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id)
