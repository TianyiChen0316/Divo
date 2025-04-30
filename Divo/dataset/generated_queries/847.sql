--{"gen": "combine", "time": "/", "template": "13d", "dataset": "full_job", "rows": null}
SELECT min(miidx.info) AS rating,
min(t.title) AS movie
FROM company_type AS ct,
info_type AS it2,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t,
cast_info AS ci,
info_type AS it1,
movie_keyword AS mk,
name AS n,
role_type AS rt,
aka_name AS an
WHERE (ct.kind = 'production companies' AND it2.info = 'release dates' AND kt.kind = 'movie' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND n.gender = 'm' AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND mc.movie_id = t.id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mk.movie_id AND mk.movie_id = mc.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND rt.id = ci.role_id AND an.person_id = n.id AND an.person_id = ci.person_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND miidx.info_type_id = mi.info_type_id AND miidx.info_type_id = it1.id AND miidx.info_type_id = it2.id AND it1.id = it2.id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id)
