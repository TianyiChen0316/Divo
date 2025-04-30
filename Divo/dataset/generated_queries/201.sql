--{"gen": "erase", "time": "/", "template": "generated-f07829b7-f8e9-42ae-b56d-09e192c846f8", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS russian_movie
FROM cast_info AS ci,
movie_companies AS mc,
title AS t,
info_type AS it1,
person_info AS pi,
aka_title AS at,
keyword AS k,
movie_info AS mi,
movie_keyword AS mk
WHERE (ci.note LIKE '%(voice)%' AND ci.note NOT LIKE '%(voice)%' AND t.production_year > 2003 AND lower(it1.info) LIKE 'rating' AND lower(pi.info) LIKE '%usa%' AND mi.note LIKE '%internet%' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND ci.person_id = pi.person_id AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND ci.movie_id = mk.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id)
