--{"gen": "erase", "time": "/", "template": "generated-f71b336e-d20a-4c99-b688-97b58dcd4785", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS producing_company,
min(miidx.info) AS rating,
min(t.title) AS movie_about_winning
FROM company_name AS cn,
company_type AS ct,
info_type AS it2,
kind_type AS kt,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t,
aka_name AS an,
cast_info AS ci,
movie_keyword AS mk
WHERE (cn.country_code = '[us]' AND ct.kind = 'production companies' AND it2.info = 'rating' AND kt.kind = 'movie' AND t.title <> '' AND (t.title LIKE '%Champion%' OR t.title LIKE '%Loser%') AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)
