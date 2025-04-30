--{"gen": "combine", "time": "/", "template": "generated-59fa6840-7991-4efe-b7a6-9a1e5a4f78e9", "dataset": "full_job", "rows": null}
SELECT *
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n,
info_type AS it,
kind_type AS kt,
movie_info_idx AS miidx,
title AS t
WHERE (k.keyword LIKE '%sequel%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND n.name LIKE '%B%' AND it.info = 'rating' AND kt.kind = 'movie' AND t.title <> '' AND (t.title LIKE 'Champion%' OR t.title LIKE 'Loser%') AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND n.id = ci.person_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = t.id AND kt.id = t.kind_id AND mc.movie_id = t.id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id)
