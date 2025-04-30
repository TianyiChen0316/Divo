--{"gen": "combine", "time": "/", "template": "generated-539bf0bf-17bf-43f9-8eb9-c075ca49aef2", "dataset": "full_job", "rows": null}
SELECT min(t.title)
FROM cast_info AS ci,
role_type AS rt,
movie_companies AS mc,
title AS t,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi,
complete_cast AS cc,
company_name AS cn,
info_type AS it1,
kind_type AS kt,
movie_info_idx AS mi_idx,
aka_title AS at
WHERE (ci.note NOT LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND t.production_year > 2010 AND k.keyword ILIKE '%love%' AND mi.info ILIKE '%romance%' AND cn.country_code <> '[us]' AND it1.info = 'countries' AND kt.kind IN ('movie', 'episode') AND mi_idx.info > '6.5' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND kt.id = t.kind_id AND t.id = mi_idx.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND t.id = at.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND at.movie_id = cc.movie_id AND at.movie_id = mi_idx.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id)
