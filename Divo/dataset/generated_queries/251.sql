--{"gen": "combine", "time": "/", "template": "generated-37d9ac05-6891-44a1-8a80-31af2d14e7bc", "dataset": "full_job", "rows": null}
SELECT min(lt.link) AS link_type,
min(t1.title) AS first_movie,
min(t2.title) AS second_movie
FROM keyword AS k,
link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
title AS t1,
title AS t2,
movie_info AS mi,
title AS t,
cast_info AS ci,
name AS n
WHERE (k.keyword = 'character-name-in-title' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND ml.linked_movie_id = t2.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND ci.movie_id = mi.movie_id)
