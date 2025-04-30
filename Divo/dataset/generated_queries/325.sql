--{"gen": "erase", "time": "/", "template": "20a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_downey_ironman_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
char_name AS chn,
cast_info AS ci,
movie_keyword AS mk,
name AS n,
title AS t
WHERE (cct1.kind = 'cast' AND chn.name NOT LIKE '%Sherlock%' AND (chn.name LIKE '%Tony%Stark%' OR chn.name LIKE '%Iron%Man%') AND t.production_year BETWEEN 1950 AND 2000 AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND cct1.id = cc.subject_id)
