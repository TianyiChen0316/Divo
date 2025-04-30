--{"gen": "combine", "time": "/", "template": "generated-93736b45-b812-497e-832e-3456be266d2c", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_based_on_book
FROM movie_companies AS mc,
movie_link AS ml,
title AS t,
cast_info AS ci,
role_type AS rt,
complete_cast AS cc,
comp_cast_type AS cct1,
info_type AS it1,
movie_info AS mi,
movie_keyword AS mk,
movie_info_idx AS mi_idx
WHERE (mc.note IS NOT NULL AND t.production_year BETWEEN 2005 AND 2015 AND rt.role = 'writer' AND cct1.kind = 'complete+verified' AND it1.info = 'rating' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND ml.movie_id = t.id AND t.id = mc.movie_id AND ml.movie_id = mc.movie_id AND ci.movie_id = t.id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND it1.id = mi.info_type_id AND cct1.id = cc.status_id AND t.id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND ci.movie_id = cc.movie_id AND cc.movie_id = mi_idx.movie_id AND ml.movie_id = cc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id)
