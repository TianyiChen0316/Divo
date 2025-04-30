--{"gen": "erase", "time": "/", "template": "6a", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name,
min(t.title) AS marvel_movie
FROM cast_info AS ci,
movie_keyword AS mk,
name AS n,
title AS t
WHERE (n.name LIKE '%Downey%Robert%' AND t.production_year BETWEEN 2005 AND 2008 AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id)
