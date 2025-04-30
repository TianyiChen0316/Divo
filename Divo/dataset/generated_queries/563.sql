--{"gen": "erase", "time": "/", "template": "generated-32b1ef69-5303-4074-b193-573b1234a2a3", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS american_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
cast_info AS ci,
movie_keyword AS mk,
movie_link AS ml,
movie_info_idx AS mi_idx,
aka_title AS at,
complete_cast AS cc,
comp_cast_type AS cct1,
name AS n,
info_type AS it1
WHERE (mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year > 1990 AND cct1.kind = 'crew' AND it1.info = 'genres' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = ml.linked_movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND ml.linked_movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = ml.linked_movie_id AND t.id = mi_idx.movie_id AND t.id = at.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = ml.linked_movie_id AND at.movie_id = mi_idx.movie_id AND t.id = cc.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND cc.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND cct1.id = cc.subject_id AND it1.id = mi.info_type_id AND mc.movie_id = cc.movie_id AND cc.movie_id = mi.movie_id AND at.movie_id = cc.movie_id AND cc.movie_id = ml.linked_movie_id)
