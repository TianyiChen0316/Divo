--{"gen": "combine", "time": "/", "template": "generated-b344467c-ba3c-4da1-9b07-edd3501170d9", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(n.name) AS male_writer
FROM cast_info AS ci,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
info_type AS it1,
title AS t,
person_info AS pi
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it2.info = 'votes' AND mi.info = 'Horror' AND n.gender = 'm' AND lower(it1.info) LIKE 'rating' AND lower(pi.info) LIKE '%usa%' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND it2.id = mi_idx.info_type_id AND it1.id = mi_idx.info_type_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND n.id = pi.person_id AND pi.person_id = ci.person_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND it1.id = it2.id)
