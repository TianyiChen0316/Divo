--{"gen": "erase", "time": "/", "template": "generated-eee9be76-2ced-4a72-919f-977c3b46de1d", "dataset": "full_job", "rows": null}
SELECT min(miidx.info) AS rating,
min(t.title) AS movie_about_winning
FROM kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t,
keyword AS k,
movie_keyword AS mk
WHERE (kt.kind = 'movie' AND t.title <> '' AND (t.title LIKE 'Champion%' OR t.title LIKE 'Loser%') AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND mi.movie_id = t.id AND kt.id = t.kind_id AND mc.movie_id = t.id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND k.id = mk.keyword_id AND miidx.movie_id = mk.movie_id)
