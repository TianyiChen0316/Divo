--{"gen": "erase", "time": "/", "template": "32b", "dataset": "full_job", "rows": null}
SELECT min(lt.link) AS link_type,
min(t2.title) AS second_movie
FROM link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
title AS t2
WHERE (ml.linked_movie_id = t2.id AND lt.id = ml.link_type_id AND ml.movie_id = mk.movie_id)
