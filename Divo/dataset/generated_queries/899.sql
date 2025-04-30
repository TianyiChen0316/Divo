--{"gen": "erase", "time": "/", "template": "generated-17dbde4f-fd50-4bc7-9c15-bd3897ed380a", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
movie_info AS mi,
name AS n,
company_type AS ct,
movie_companies AS mc,
aka_title AS at,
info_type AS it2,
kind_type AS kt,
movie_info_idx AS miidx
WHERE (mi_idx.info > '7.0' AND t.production_year > 2008 AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender = 'm' AND ct.kind = 'production companies' AND mc.note LIKE '%(200%)%' AND it2.info = 'release dates' AND kt.kind = 'movie' AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = mi.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND n.id = ci.person_id AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = at.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND at.movie_id = ci.movie_id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.info_type_id = mi_idx.info_type_id AND miidx.movie_id = at.movie_id AND miidx.movie_id = mi_idx.movie_id)
