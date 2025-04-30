--{"gen": "erase", "time": "/", "template": "generated-a847831e-749a-4eb8-b10c-dc814590544d", "dataset": "full_job", "rows": null}
SELECT min(lt.link) AS link_type,
min(t1.title) AS first_movie
FROM link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
title AS t1,
movie_info AS mi,
title AS t
WHERE (mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id)
