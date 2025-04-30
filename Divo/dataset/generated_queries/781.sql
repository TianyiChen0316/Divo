--{"gen": "erase", "time": "/", "template": "generated-bd089e7f-cf2f-4c8b-952e-99d6d9f5e3ce", "dataset": "full_job", "rows": null}
SELECT min(kt.kind) AS movie_kind,
min(t.title) AS complete_nerdy_internet_movie
FROM info_type AS it1,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
movie_info_idx AS mi_idx,
aka_name AS an,
cast_info AS ci,
name AS n
WHERE (it1.info = 'release dates' AND kt.kind IN ('movie') AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND t.production_year > 2000 AND mi_idx.info < '3.0' AND ci.note = '(voice)' AND n.gender = 'm' AND n.name LIKE '%Angel%' AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND it1.id = mi.info_type_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
