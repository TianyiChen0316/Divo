--{"gen": "combine", "time": "/", "template": "generated-c2f89b1c-a198-4a74-93eb-e211e28e533d", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie,
min(n.name) AS a1
FROM cast_info AS ci,
movie_companies AS mc,
name AS n,
title AS t,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
aka_name AS an
WHERE (n.name LIKE 'Z%' AND it1.info = 'budget' AND it2.info = 'votes' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND an.person_id = ci.person_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND n.id = an.person_id)
