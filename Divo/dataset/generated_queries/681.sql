--{"gen": "erase", "time": "/", "template": "generated-89d4a578-8930-4b73-91a4-6803026f89dd", "dataset": "full_job", "rows": null}
SELECT min(t1.title) AS first_movie
FROM movie_keyword AS mk,
movie_link AS ml,
title AS t1,
movie_info AS mi,
title AS t,
cast_info AS ci,
movie_companies AS mc
WHERE (mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND ci.note LIKE '%(voice)%' AND ci.note LIKE '%(voice)%' AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = t1.id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND mc.movie_id = t1.id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND t1.id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id)
