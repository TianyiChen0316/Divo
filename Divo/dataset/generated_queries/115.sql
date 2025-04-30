--{"gen": "erase", "time": "/", "template": "generated-a47853a7-81ee-4f40-aee7-36c7021dd010", "dataset": "full_job", "rows": null}
SELECT min(lt.link) AS link_type,
min(t.title) AS complete_western_sequel
FROM complete_cast AS cc,
comp_cast_type AS cct2,
company_type AS ct,
link_type AS lt,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
movie_info_idx AS mi_idx,
cast_info AS ci,
movie_info_idx AS miidx
WHERE (cct2.kind = 'complete' AND ct.kind = 'production companies' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND mi.info IN ('Sweden', 'Germany', 'Swedish', 'German') AND t.production_year BETWEEN 1950 AND 2000 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mi.movie_id = t.id AND t.id = cc.movie_id AND cct2.id = cc.status_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mi_idx.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = cc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND cc.movie_id = mi_idx.movie_id)
