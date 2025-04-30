--{"gen": "combine", "time": "/", "template": "generated-03a36471-29eb-4115-ad51-1ff59779a679", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM movie_companies AS mc,
movie_info_idx AS mi_idx,
cast_info AS ci,
company_name AS cn,
role_type AS rt,
complete_cast AS cc,
comp_cast_type AS cct1,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
title AS t
WHERE (mc.note LIKE '%(co-production)%' AND ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND cn.country_code = '[ru]' AND rt.role = 'actor' AND cct1.kind = 'cast' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'English') AND t.production_year BETWEEN 2005 AND 2008 AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ci.movie_id = mi_idx.movie_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mi.movie_id = t.id AND t.id = cc.movie_id AND cct1.id = cc.subject_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND t.id = ci.movie_id AND t.id = mi_idx.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
