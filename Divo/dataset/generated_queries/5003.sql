--{"gen": "combine", "time": "/", "template": "generated-25b3d3fe-c6c7-4023-a4f8-b122d7fc4913", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(t.title) AS movie_title
FROM cast_info AS ci,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n,
title AS t,
person_info AS pi,
aka_name AS an,
movie_companies AS mc
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'votes' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender = 'm' AND lower(pi.info) LIKE '%india%' AND mc.note NOT LIKE '%(USA)%' AND mc.note LIKE '%(Japan)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND ci.person_id = pi.person_id AND mi_idx.info_type_id = pi.info_type_id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND n.id = an.person_id AND pi.person_id = an.person_id)
