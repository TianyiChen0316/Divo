--{"gen": "erase", "time": "/", "template": "generated-76e1f641-bf7d-4019-a09e-e59f8a42a342", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(miidx.info) AS rating,
min(t.title) AS german_movie
FROM company_name AS cn,
info_type AS it2,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t,
aka_title AS at
WHERE (cn.country_code = '[de]' AND it2.info = 'release dates' AND kt.kind = 'movie' AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND t.id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND miidx.movie_id = at.movie_id)
