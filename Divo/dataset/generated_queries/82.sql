--{"gen": "erase", "time": "/", "template": "generated-25ed0844-3171-46b6-bfcf-1ffcd1261ccc", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(t.title) AS movie_title
FROM cast_info AS ci,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
aka_name AS an,
movie_companies AS mc
WHERE (ci.note IN ('(producer)', '(executive producer)') AND it1.info = 'budget' AND it2.info = 'votes' AND mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(Japan)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id)
