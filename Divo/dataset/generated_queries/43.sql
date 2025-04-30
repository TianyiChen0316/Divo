--{"gen": "combine", "time": "/", "template": "generated-8b8c6136-d872-4ac6-ae46-f985f21c73ba", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n,
keyword AS k,
kind_type AS kt,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
complete_cast AS cc
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it2.info = 'rating' AND mi.info IN ('Horror', 'Thriller') AND mi.note IS NULL AND mi_idx.info > '6.0' AND n.gender IS NOT NULL AND n.gender = 'f' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind IN ('movie', 'episode') AND mc.note NOT LIKE '%(USA)%' AND mc.note LIKE '%(200%)%' AND t.production_year > 2009 AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it2.id = mi_idx.info_type_id AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND cc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND cc.movie_id = mk.movie_id AND cc.movie_id = mi.movie_id)
