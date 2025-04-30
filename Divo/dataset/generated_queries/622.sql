--{"gen": "combine", "time": "/", "template": "generated-aa0163a6-320f-42b7-8d82-98cd1a831b82", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
keyword AS k,
kind_type AS kt,
movie_companies AS mc,
title AS t,
aka_title AS at,
company_name AS cn,
complete_cast AS cc,
comp_cast_type AS cct2,
company_type AS ct
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it2.info = 'release dates' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind IN ('movie', 'episode') AND t.production_year > 2005 AND cn.country_code = '[ru]' AND cct2.kind LIKE '%complete%' AND ct.kind = 'production companies' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it2.id = mi_idx.info_type_id AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND t.id = at.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND cn.id = mc.company_id AND t.id = cc.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct2.id = cc.status_id AND mc.movie_id = cc.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = cc.movie_id AND cc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND at.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id)
