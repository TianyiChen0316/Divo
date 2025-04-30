--{"gen": "combine", "time": "/", "template": "generated-8cfeff59-903f-4db9-b9d8-5b0a0c281d57", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS russian_movie
FROM cast_info AS ci,
movie_companies AS mc,
title AS t,
company_name AS cn,
movie_keyword AS mk,
company_type AS ct,
role_type AS rt,
complete_cast AS cc,
movie_info AS mi,
movie_link AS ml,
title AS t1,
char_name AS chn,
movie_info_idx AS mi_idx
WHERE (ci.note LIKE '%(voice)%' AND ci.note NOT LIKE '%(voice)%' AND t.production_year > 2003 AND cn.country_code = '[de]' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND mi_idx.info > '3.0' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND t.id = mk.movie_id AND mc.company_id = cn.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND rt.id = ci.role_id AND ct.id = mc.company_type_id AND t.id = mi.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = ml.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND mc.movie_id = ml.movie_id AND mc.movie_id = t1.id AND ml.movie_id = cc.movie_id AND ml.movie_id = mi.movie_id AND t1.id = cc.movie_id AND t1.id = mi.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND chn.id = ci.person_role_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND ml.movie_id = mi_idx.movie_id AND t1.id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
