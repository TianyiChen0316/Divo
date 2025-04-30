--{"gen": "combine", "time": "/", "template": "generated-64d14d0f-6137-4825-9f56-6d0834cee7d6", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_info AS mi,
movie_keyword AS mk,
title AS t,
aka_name AS an,
cast_info AS ci,
movie_companies AS mc,
name AS n,
movie_info_idx AS miidx,
complete_cast AS cc,
comp_cast_type AS cct1,
company_type AS ct,
keyword AS k,
movie_info_idx AS mi_idx
WHERE (mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND cct1.kind = 'complete' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND mi_idx.info < '3.5' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND mi.info_type_id = miidx.info_type_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND k.id = mk.keyword_id AND ct.id = mc.company_type_id AND cct1.id = cc.subject_id AND miidx.movie_id = cc.movie_id AND miidx.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id)
