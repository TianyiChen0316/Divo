--{"gen": "erase", "time": "/", "template": "generated-8190c8b3-86cc-4104-967b-b199cbe024fd", "dataset": "full_job", "rows": null}
SELECT min(lt.link) AS movie_link_type,
min(t.title) AS sequel_movie
FROM link_type AS lt,
movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
movie_info AS mi
WHERE (lt.link LIKE '%follows%' AND mc.note IS NULL AND t.production_year = 1998 AND t.title LIKE '%Money%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'English') AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = t.id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id)
