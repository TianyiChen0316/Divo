--{"gen": "erase", "time": "/", "template": "4c", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t
WHERE (k.keyword LIKE '%sequel%' AND mi_idx.info > '2.0' AND t.production_year BETWEEN 2007 AND 2010 AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id)
