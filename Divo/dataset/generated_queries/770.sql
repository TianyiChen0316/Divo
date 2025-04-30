--{"gen": "combine", "time": "/", "template": "generated-67179d0d-16e7-4b5e-80cd-5c42a0035477", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS marvel_movie
FROM cast_info AS ci,
movie_keyword AS mk,
title AS t,
aka_name AS an,
movie_companies AS mc,
complete_cast AS cc,
comp_cast_type AS cct1,
company_type AS ct,
info_type AS it2,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (t.production_year > 2014 AND mc.note LIKE '%(Japan)%' AND mc.note LIKE '%(worldwide)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND cct1.kind = 'cast' AND it2.info = 'rating' AND kt.kind IN ('movie', 'episode') AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND it2.id = mi_idx.info_type_id AND ct.id = mc.company_type_id AND cct1.id = cc.subject_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
