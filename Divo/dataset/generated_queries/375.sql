--{"gen": "combine", "time": "/", "template": "generated-f02b3baf-939d-41dc-a927-7b2b978e5c91", "dataset": "full_job", "rows": null}
SELECT min(t1.title) AS first_movie
FROM movie_keyword AS mk,
movie_link AS ml,
title AS t1,
movie_info_idx AS mi_idx,
title AS t
WHERE (mi_idx.info > '3.0' AND t.production_year > 2008 AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = ml.movie_id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mi_idx.movie_id AND t1.id = mi_idx.movie_id)
