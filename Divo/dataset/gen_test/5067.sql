--{"gen": "combine", "time": "/", "template": "32a", "dataset": "full_job", "rows": null}
SELECT min(t1.title) AS first_movie,
min(t2.title) AS second_movie
FROM movie_keyword AS mk,
movie_link AS ml,
title AS t1,
title AS t2,
cast_info AS ci,
info_type AS it2,
movie_info_idx AS mi_idx,
aka_name AS an1,
movie_companies AS mc,
name AS n1
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it2.info = 'bottom 10 rank' AND mc.note LIKE '%(1994)%' AND mc.note LIKE '%(USA)%' AND n1.name LIKE '%Yo%' AND n1.name LIKE '%Tim%' AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND ml.linked_movie_id = t2.id AND mk.movie_id = ml.movie_id AND ci.movie_id = mi_idx.movie_id AND it2.id = mi_idx.info_type_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = t1.id AND t1.id = ci.movie_id AND t1.id = mi_idx.movie_id)
