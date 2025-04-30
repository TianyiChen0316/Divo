--{"gen": "combine", "time": "/", "template": "generated-3440bd9a-6afb-4a2d-acfd-cc2dccd79ad1", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(miidx.info) AS rating,
min(t.title) AS hongkong_movie
FROM kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t,
movie_link AS ml,
aka_name AS an,
cast_info AS ci,
complete_cast AS cc,
name AS n,
person_info AS pi,
company_type AS ct,
info_type AS it,
movie_info_idx AS mi_idx
WHERE (kt.kind = 'movie' AND n.gender = 'f' AND n.name LIKE '%An%' AND ct.kind = 'production companies' AND it.info = 'release dates' AND mi.movie_id = t.id AND kt.id = t.kind_id AND mc.movie_id = t.id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND ml.movie_id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND t.id = ml.movie_id AND t.id = ci.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND t.id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND n.id = ci.person_id AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND miidx.movie_id = cc.movie_id AND ml.movie_id = cc.movie_id AND pi.person_id = an.person_id AND ct.id = mc.company_type_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND miidx.movie_id = mi_idx.movie_id AND ml.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
