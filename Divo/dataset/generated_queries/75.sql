--{"gen": "combine", "time": "/", "template": "generated-a1104c92-12ac-4b3b-8a05-f7f1021d4bfc", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
info_type AS it,
kind_type AS kt,
movie_info_idx AS miidx,
movie_keyword AS mk,
movie_link AS ml,
title AS t1,
movie_companies AS mc1,
movie_info_idx AS mi_idx1,
movie_info_idx AS mi_idx2
WHERE (mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND it.info = 'rating' AND kt.kind = 'movie' AND mi_idx2.info < '3.5' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND t.id = mk.movie_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = t1.id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = t1.id AND t1.id = mi.movie_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND mi.info_type_id = mi_idx1.info_type_id AND t.id = mi_idx1.movie_id AND t.id = mc1.movie_id AND mi_idx1.movie_id = mc.movie_id AND mi_idx1.movie_id = t1.id AND mi_idx1.movie_id = mk.movie_id AND mi_idx1.movie_id = mi.movie_id AND mc.movie_id = mc1.movie_id AND t1.id = mc1.movie_id AND mc1.movie_id = mk.movie_id AND mc1.movie_id = mi.movie_id AND mi_idx2.info_type_id = mi.info_type_id AND mi_idx2.info_type_id = mi_idx1.info_type_id AND mi_idx1.movie_id = miidx.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = t1.id AND miidx.movie_id = mc1.movie_id AND miidx.movie_id = mk.movie_id)
