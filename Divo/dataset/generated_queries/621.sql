--{"gen": "erase", "time": "/", "template": "generated-6695f40c-ff2c-448a-97d6-226021c6c0dc", "dataset": "full_job", "rows": null}
SELECT min(mi_idx1.info) AS first_rating,
min(mi_idx2.info) AS second_rating,
min(t2.title) AS second_movie
FROM info_type AS it2,
movie_companies AS mc1,
movie_companies AS mc2,
movie_info_idx AS mi_idx1,
movie_info_idx AS mi_idx2,
movie_link AS ml,
title AS t2,
company_name AS cn2
WHERE (it2.info = 'rating' AND mi_idx2.info < '3.5' AND t2.production_year BETWEEN 2000 AND 2010 AND t2.id = ml.linked_movie_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND it2.id = mi_idx2.info_type_id AND t2.id = mi_idx2.movie_id AND t2.id = mc2.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mi_idx2.movie_id = mc2.movie_id AND cn2.id = mc2.company_id)
