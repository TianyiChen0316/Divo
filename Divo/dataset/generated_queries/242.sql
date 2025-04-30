--{"gen": "erase", "time": "/", "template": "generated-a75390ba-9913-4db0-b722-5e137b3f198a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_companies AS mc,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
movie_info AS mi,
info_type AS it1,
person_info AS pi
WHERE (it1.id = 3 AND lower(mi.info) LIKE '%adult%' AND lower(pi.info) LIKE '%japan%' AND mc.movie_id = t.id AND t.id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = t.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi.movie_id AND it1.id = mi.info_type_id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id)
