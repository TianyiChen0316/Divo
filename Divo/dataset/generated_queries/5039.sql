--{"gen": "erase", "time": "/", "template": "generated-338681a5-8df5-455f-b7e4-b3edfe7430f0", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(t.title) AS complete_violent_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
comp_cast_type AS cct2,
cast_info AS ci,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
company_name AS cn,
movie_companies AS mc,
movie_info_idx AS miidx
WHERE (cct1.kind IN ('cast', 'crew') AND cct2.kind = 'complete+verified' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'height' AND mi.info IN ('Horror', 'Thriller') AND t.production_year > 2000 AND cn.country_code = '[ru]' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = cc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id)
