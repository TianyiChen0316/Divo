--{"gen": "combine", "time": "/", "template": "23c", "dataset": "full_job", "rows": null}
SELECT min(kt.kind) AS movie_kind,
min(t.title) AS complete_us_internet_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
company_name AS cn,
company_type AS ct,
info_type AS it1,
keyword AS k,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
movie_info_idx AS mi_idx,
aka_title AS at
WHERE (cct1.kind = 'complete+verified' AND cn.country_code = '[us]' AND it1.info = 'release dates' AND kt.kind IN ('movie', 'tv movie', 'video movie', 'video game') AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.production_year > 1990 AND mi_idx.info < '3.0' AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND cct1.id = cc.status_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND mi_idx.movie_id = cc.movie_id AND t.id = at.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND at.movie_id = cc.movie_id AND at.movie_id = mi_idx.movie_id)
