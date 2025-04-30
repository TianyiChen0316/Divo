--{"gen": "erase", "time": "/", "template": "generated-0093eb90-a2ff-4a2e-a25e-84d3b2a8004d", "dataset": "full_job", "rows": null}
SELECT min(miidx.info) AS rating,
min(t.title) AS movie_about_winning
FROM company_type AS ct,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t,
aka_name AS an,
cast_info AS ci
WHERE (ct.kind = 'production companies' AND kt.kind = 'movie' AND t.title <> '' AND (t.title LIKE '%Champion%' OR t.title LIKE '%Loser%') AND mi.movie_id = t.id AND kt.id = t.kind_id AND mc.movie_id = t.id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND ci.movie_id = t.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id)
