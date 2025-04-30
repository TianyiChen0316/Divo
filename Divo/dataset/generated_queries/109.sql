--{"gen": "erase", "time": "/", "template": "generated-60f88fbb-5edb-46cf-a604-787e993bd69e", "dataset": "full_job", "rows": null}
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
movie_info AS mi
WHERE (ci.note LIKE '%(voice)%' AND cn.country_code = '[us]' AND t.production_year BETWEEN 2006 AND 2007 AND lower(mi.info) LIKE '%action%' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND mi.movie_id = t.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id)
