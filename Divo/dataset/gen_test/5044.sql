--{"gen": "combine", "time": "/", "template": "3b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
movie_info_idx AS mi_idx
WHERE (k.keyword LIKE '%sequel%' AND mi.info IN ('Bulgaria') AND t.production_year > 2010 AND mi_idx.info > '3.0' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mi.movie_id)
