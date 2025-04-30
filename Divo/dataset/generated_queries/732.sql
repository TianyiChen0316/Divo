--{"gen": "erase", "time": "/", "template": "generated-37d9ac05-6891-44a1-8a80-31af2d14e7bc", "dataset": "full_job", "rows": null}
SELECT min(lt.link) AS link_type,
min(t1.title) AS first_movie,
min(t2.title) AS second_movie
FROM keyword AS k,
link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
title AS t1,
title AS t2
WHERE (k.keyword = 'character-name-in-title' AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND ml.linked_movie_id = t2.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND ml.movie_id = mk.movie_id)
