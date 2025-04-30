--{"gen": "combine", "time": "/", "template": "e1a", "dataset": "full_job", "rows": null}
SELECT min(cn.name)
FROM cast_info AS ci,
char_name AS cn,
link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
title AS t1,
movie_info AS mi
WHERE (ci.role_id = 2 AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND cn.id = ci.person_role_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND mk.movie_id = mi.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id)
