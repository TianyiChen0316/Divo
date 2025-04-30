--{"gen": "erase", "time": "/", "template": "32b", "dataset": "full_job", "rows": null}
SELECT min(lt.link) AS link_type,
min(t1.title) AS first_movie
FROM link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
title AS t1
WHERE (t1.id = mk.movie_id AND ml.movie_id = t1.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND ml.movie_id = mk.movie_id)
