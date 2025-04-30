--{"gen": "erase", "time": "/", "template": "generated-aa8379a1-7137-4915-afce-0c20e6258ab7", "dataset": "full_job", "rows": null}
SELECT min(kt.kind) AS movie_kind,
min(t.title) AS complete_us_internet_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
company_name AS cn,
company_type AS ct,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
movie_link AS ml,
title AS t1,
movie_info_idx AS miidx
WHERE (cct1.kind = 'complete+verified' AND cn.country_code = '[us]' AND kt.kind IN ('movie') AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.production_year > 2000 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND cct1.id = cc.status_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = ml.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND mc.movie_id = ml.movie_id AND mc.movie_id = t1.id AND ml.movie_id = cc.movie_id AND ml.movie_id = mi.movie_id AND t1.id = cc.movie_id AND t1.id = mi.movie_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = t1.id AND miidx.movie_id = cc.movie_id AND miidx.movie_id = mk.movie_id)
