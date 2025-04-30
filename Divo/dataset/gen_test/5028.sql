--{"gen": "combine", "time": "/", "template": "generated-f327544d-23c3-43d2-804e-03f3ffd2df1d", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n,
aka_name AS an1,
movie_companies AS mc,
name AS n1,
role_type AS rt,
movie_keyword AS mk,
title AS t,
person_info AS pi
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'votes' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender = 'm' AND mc.note LIKE '%(1994)%' AND mc.note NOT LIKE '%(USA)%' AND n1.name LIKE '%Yo%' AND n1.name NOT LIKE '%Yu%' AND rt.role = 'actress' AND lower(pi.info) LIKE '%usa%' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND an1.person_id = n.id AND n.id = n1.id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND pi.person_id = ci.person_id AND t.id = mc.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND mi_idx.info_type_id = pi.info_type_id AND an1.person_id = pi.person_id AND n1.id = pi.person_id)
