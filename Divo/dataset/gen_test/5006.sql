--{"gen": "erase", "time": "/", "template": "generated-6e892d53-1fcc-427d-8605-eff4df03d20a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_about_winning
FROM info_type AS it2,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
title AS t,
aka_name AS an,
cast_info AS ci,
name AS n
WHERE (it2.info = 'mini biography' AND kt.kind = 'movie' AND t.title <> '' AND (t.title LIKE '%Champion%' OR t.title LIKE '%Loser%') AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND mc.movie_id = t.id AND mi.movie_id = mc.movie_id AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mi.movie_id)
