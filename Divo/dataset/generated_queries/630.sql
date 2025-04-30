--{"gen": "erase", "time": "/", "template": "generated-c97d02be-9c3c-4f02-aa35-1c7bb8db1048", "dataset": "full_job", "rows": null}
SELECT min(t1.title) AS first_movie
FROM movie_keyword AS mk,
movie_link AS ml,
title AS t1,
movie_info AS mi,
aka_title AS at,
info_type AS it1,
movie_companies AS mc,
cast_info AS ci,
name AS n
WHERE (mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND it1.info = 'top 250 rank' AND n.name LIKE 'Z%' AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = t1.id AND mk.movie_id = mi.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND ml.movie_id = mc.movie_id AND ml.movie_id = at.movie_id AND mc.movie_id = t1.id AND t1.id = at.movie_id AND n.id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id)
