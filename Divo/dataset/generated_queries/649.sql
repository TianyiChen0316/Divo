--{"gen": "combine", "time": "/", "template": "generated-389edd74-e5a0-40fc-b685-1bd476b80e73", "dataset": "full_job", "rows": null}
SELECT min(mi_idx1.info) AS first_rating,
min(mi_idx2.info) AS second_rating,
min(t1.title) AS first_movie,
min(t2.title) AS second_movie
FROM kind_type AS kt2,
movie_companies AS mc1,
movie_companies AS mc2,
movie_info_idx AS mi_idx1,
movie_info_idx AS mi_idx2,
movie_link AS ml,
title AS t1,
title AS t2,
cast_info AS ci,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n,
title AS t
WHERE (kt2.kind IN ('tv series') AND mi_idx2.info > '8.0' AND t2.production_year = 2007 AND ci.note IN ('(producer)', '(executive producer)') AND n.gender = 'm' AND n.name LIKE '%Tim%' AND t1.id = ml.movie_id AND t2.id = ml.linked_movie_id AND t1.id = mi_idx1.movie_id AND t1.id = mc1.movie_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND t2.id = mi_idx2.movie_id AND kt2.id = t2.kind_id AND t2.id = mc2.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mi_idx2.movie_id = mc2.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND mi.info_type_id = mi_idx1.info_type_id)
