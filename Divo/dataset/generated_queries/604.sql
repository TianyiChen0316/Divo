--{"gen": "combine", "time": "/", "template": "generated-0ef79051-9f6f-4111-ad95-81c49ef03f3d", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
movie_companies AS mc,
movie_info AS mi,
company_type AS ct,
movie_info_idx AS miidx,
cast_info AS ci,
complete_cast AS cc,
comp_cast_type AS cct1,
movie_link AS ml,
info_type AS it1,
company_name AS cn
WHERE (mi_idx.info > '5.0' AND t.production_year > 2005 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND ct.kind = 'production companies' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cct1.kind = 'cast' AND it1.info = 'countries' AND cn.country_code = '[ru]' AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND t.id = cc.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct1.id = cc.subject_id AND ml.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND cc.movie_id = mi.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = cc.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ml.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id)
