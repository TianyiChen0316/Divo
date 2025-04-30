--{"gen": "combine", "time": "/", "template": "generated-baae24e4-6e9b-4eb1-8dfc-d56225748c84", "dataset": "full_job", "rows": null}
SELECT min(t1.title) AS first_movie
FROM movie_keyword AS mk,
movie_link AS ml,
title AS t1,
cast_info AS ci,
title AS t,
char_name AS chn
WHERE (t.kind_id = 3 AND ci.role_id = 1 AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = ml.movie_id AND ci.movie_id = t.id AND chn.id = ci.person_role_id AND t.id = mk.movie_id AND mk.movie_id = ci.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id)
