--{"gen": "combine", "time": "/", "template": "10b", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character,
min(t.title) AS russian_mov_with_actor_producer
FROM char_name AS chn,
cast_info AS ci,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
role_type AS rt,
title AS t,
movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi
WHERE (ci.note LIKE '%(producer)%' AND cn.country_code = '[ru]' AND rt.role = 'actor' AND t.production_year > 2010 AND it.id = 3 AND k.keyword ILIKE '%love%' AND mi.info ILIKE '%france%' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id)
