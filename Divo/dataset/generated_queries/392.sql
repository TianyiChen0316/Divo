--{"gen": "combine", "time": "/", "template": "10b", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character,
min(t.title) AS russian_mov_with_actor_producer
FROM char_name AS chn,
cast_info AS ci,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
title AS t,
info_type AS it,
info_type AS it2,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (ci.note LIKE '%(producer)%' AND cn.country_code = '[ru]' AND t.production_year > 2010 AND it.info = 'rating' AND it2.info = 'release dates' AND kt.kind = 'movie' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id)
