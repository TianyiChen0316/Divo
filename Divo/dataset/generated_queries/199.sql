--{"gen": "erase", "time": "/", "template": "generated-1b191376-67b2-4336-a280-10179cf2a679", "dataset": "full_job", "rows": null}
SELECT min(t1.title) AS first_movie
FROM movie_keyword AS mk,
movie_link AS ml,
title AS t1,
cast_info AS ci,
title AS t,
complete_cast AS cc,
movie_info AS mi,
movie_info_idx AS mi_idx,
person_info AS pi
WHERE (t.kind_id = 3 AND ci.role_id = 1 AND mi.info IN ('Horror', 'Thriller') AND mi.note IS NULL AND mi_idx.info < '3.5' AND pi.info ILIKE '%199%' AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = ml.movie_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = ci.movie_id AND ml.movie_id = cc.movie_id AND t1.id = ci.movie_id AND t1.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.person_id = pi.person_id AND mi.info_type_id = pi.info_type_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id AND t1.id = mi.movie_id AND t1.id = mi_idx.movie_id AND cc.movie_id = mi.movie_id AND cc.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id)
