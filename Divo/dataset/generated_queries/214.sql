--{"gen": "erase", "time": "/", "template": "20a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_downey_ironman_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
comp_cast_type AS cct2,
cast_info AS ci,
movie_keyword AS mk,
name AS n,
title AS t
WHERE (cct1.kind = 'cast' AND cct2.kind LIKE '%complete%' AND t.production_year > 2009 AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND n.id = ci.person_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id)
