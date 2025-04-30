--{"gen": "erase", "time": "/", "template": "generated-0229364d-9baa-4269-8c12-413caae26c82", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
title AS t,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi,
company_name AS cn,
char_name AS chn,
cast_info AS ci,
role_type AS rt,
complete_cast AS cc,
comp_cast_type AS cct1,
kind_type AS kt
WHERE (ct.kind = 'production companies' AND it.info = 'height' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year BETWEEN 2005 AND 2010 AND lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND cn.country_code = '[ru]' AND ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND rt.role = 'actor' AND cct1.kind = 'cast' AND kt.kind IN ('movie', 'tv movie', 'video movie', 'video game') AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND cn.id = mc.company_id AND mc.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND kt.id = t.kind_id AND t.id = cc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND cct1.id = cc.status_id AND ci.movie_id = cc.movie_id)
