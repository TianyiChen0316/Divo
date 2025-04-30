--{"gen": "combine", "time": "/", "template": "generated-25ed0844-3171-46b6-bfcf-1ffcd1261ccc", "dataset": "full_job", "rows": null}
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
aka_name AS an,
movie_companies AS mc,
keyword AS k,
movie_keyword AS mk
WHERE (ci.note IN ('(producer)', '(executive producer)') AND it1.info = 'budget' AND it2.info = 'votes' AND n.gender = 'm' AND n.name LIKE '%Tim%' AND mc.note LIKE '%(200%)%' AND mc.note LIKE '%(Japan)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND k.keyword LIKE '%sequel%' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND n.id = an.person_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi_idx.movie_id)
