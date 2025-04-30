--{"gen": "erase", "time": "/", "template": "generated-edbb01d0-dbf5-481b-bf2b-27ae3842688c", "dataset": "full_job", "rows": null}
SELECT min(mi_idx1.info) AS first_rating,
min(mi_idx2.info) AS second_rating,
min(t2.title) AS second_movie
FROM kind_type AS kt2,
movie_companies AS mc2,
movie_info_idx AS mi_idx1,
movie_info_idx AS mi_idx2,
movie_link AS ml,
title AS t2,
cast_info AS ci,
company_type AS ct,
movie_companies AS mc,
movie_keyword AS mk
WHERE (kt2.kind IN ('tv series') AND mi_idx2.info < '3.0' AND t2.production_year BETWEEN 2005 AND 2008 AND ct.kind = 'production companies' AND mc.note IS NULL AND t2.id = ml.linked_movie_id AND ml.movie_id = mi_idx1.movie_id AND t2.id = mi_idx2.movie_id AND kt2.id = t2.kind_id AND t2.id = mc2.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mi_idx2.movie_id = mc2.movie_id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND mi_idx1.movie_id = mc.movie_id AND mi_idx1.movie_id = ci.movie_id AND mi_idx1.movie_id = mk.movie_id)
