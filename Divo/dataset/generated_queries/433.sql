--{"gen": "erase", "time": "/", "template": "generated-e45809c0-e5ce-4347-9180-0eaa03c4cb09", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS hero_movie
FROM cast_info AS ci,
movie_keyword AS mk,
title AS t,
info_type AS it1,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (t.production_year > 2000 AND it1.info = 'genres' AND mi.info = 'Horror' AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id)
