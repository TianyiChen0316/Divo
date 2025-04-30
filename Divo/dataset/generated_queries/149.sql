--{"gen": "combine", "time": "/", "template": "e4a", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(miidx.info) AS rating,
min(t.title) AS hongkong_movie
FROM company_name AS cn,
info_type AS it,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t,
link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
aka_name AS an,
cast_info AS ci
WHERE (cn.country_code = '[hk]' AND it.info = 'rating' AND kt.kind = 'movie' AND lt.link LIKE '%follow%' AND mi.movie_id = t.id AND kt.id = t.kind_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND lt.id = ml.link_type_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND ml.movie_id = ci.movie_id AND t.id = ml.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)
