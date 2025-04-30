--{"gen": "combine", "time": "/", "template": "generated-0d764396-7533-4df3-8193-81c452c0ff36", "dataset": "full_job", "rows": null}
SELECT min(kt.kind) AS movie_kind,
min(t.title) AS complete_us_internet_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
company_name AS cn,
company_type AS ct,
keyword AS k,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
info_type AS it1,
info_type AS it2,
movie_info_idx AS mi_idx
WHERE (cct1.kind = 'complete+verified' AND cn.country_code = '[us]' AND kt.kind IN ('movie') AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.production_year BETWEEN 2006 AND 2007 AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'trivia' AND it2.info = 'votes' AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND k.id = mk.keyword_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND cct1.id = cc.status_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND ci.movie_id = cc.movie_id AND cc.movie_id = mi_idx.movie_id)
