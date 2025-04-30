--{"gen": "erase", "time": "/", "template": "generated-441269f8-9472-4af8-bc4d-fdd3c5f67301", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character,
min(t.title) AS movie_with_american_producer
FROM char_name AS chn,
cast_info AS ci,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
role_type AS rt,
title AS t,
movie_keyword AS mk,
complete_cast AS cc,
keyword AS k,
movie_info AS mi,
movie_link AS ml,
title AS t1,
movie_info_idx AS mi_idx
WHERE (ci.note LIKE '%(producer)%' AND cn.country_code = '[ru]' AND t.production_year > 1990 AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND t.id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND k.id = mk.keyword_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = ml.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND mc.movie_id = ml.movie_id AND mc.movie_id = t1.id AND ml.movie_id = cc.movie_id AND ml.movie_id = mi.movie_id AND t1.id = cc.movie_id AND t1.id = mi.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mk.movie_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = mi_idx.movie_id AND t1.id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id)
