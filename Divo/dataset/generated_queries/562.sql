--{"gen": "combine", "time": "/", "template": "generated-4429c478-0d0d-4060-b0fc-3557615723fc", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
complete_cast AS cc,
comp_cast_type AS cct1,
comp_cast_type AS cct2,
kind_type AS kt,
title AS t,
movie_info AS mi,
person_info AS pi
WHERE (cct1.kind = 'cast' AND cct2.kind LIKE '%complete%' AND kt.kind = 'movie' AND t.production_year > 2000 AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND lower(pi.info) LIKE '%usa%' AND kt.id = t.kind_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND mi.movie_id = t.id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND ci.person_id = pi.person_id)
