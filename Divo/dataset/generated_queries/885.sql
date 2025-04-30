--{"gen": "combine", "time": "/", "template": "generated-c5420774-9adb-4fbf-ae51-ba53c6ecfc60", "dataset": "full_job", "rows": null}
SELECT min(lt.link) AS link_type,
min(t1.title) AS first_movie,
min(t2.title) AS second_movie
FROM keyword AS k,
link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
title AS t1,
title AS t2,
cast_info AS ci,
title AS t,
movie_info_idx AS mi_idx
WHERE (k.keyword = 'character-name-in-title' AND t.production_year > 2000 AND mi_idx.info > '3.0' AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND ml.linked_movie_id = t2.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = ci.movie_id AND ml.movie_id = mk.movie_id AND t1.id = ci.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND ml.movie_id = mi_idx.movie_id AND t1.id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id)
