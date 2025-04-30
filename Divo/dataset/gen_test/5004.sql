--{"gen": "erase", "time": "/", "template": "generated-176c44e9-b6dc-4e49-9e32-fb145d485f20", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_info AS mi,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
movie_companies AS mc,
info_type AS it,
movie_link AS ml
WHERE (mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2014 AND it.info = 'mini biography' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ml.linked_movie_id = t.id AND ci.movie_id = ml.linked_movie_id AND it.id = mi.info_type_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id)
