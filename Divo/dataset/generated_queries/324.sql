--{"gen": "erase", "time": "/", "template": "generated-7219ab78-5da6-45a5-806d-2ec9a7ea0c8f", "dataset": "full_job", "rows": null}
SELECT *
FROM keyword AS k,
movie_keyword AS mk,
info_type AS it1,
movie_info AS mi,
cast_info AS ci,
person_info AS pi,
company_type AS ct,
movie_companies AS mc,
title AS t,
company_name AS cn
WHERE (k.keyword LIKE '%sequel%' AND lower(pi.info) LIKE '%india%' AND lower(it1.info) LIKE '%count%' AND lower(mi.info) LIKE '%usa%' AND ct.kind = 'production companies' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note LIKE '%(co-production)%' OR mc.note LIKE '%(presents)%') AND cn.country_code = '[us]' AND k.id = mk.keyword_id AND mi.info_type_id = it1.id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND ci.person_id = pi.person_id AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mc.company_id = cn.id)
