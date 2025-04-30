--{"gen": "erase", "time": "/", "template": "20a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_downey_ironman_movie
FROM complete_cast AS cc,
char_name AS chn,
cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
name AS n,
title AS t
WHERE (chn.name NOT LIKE '%Sherlock%' AND (chn.name LIKE '%Tony%Stark%' OR chn.name LIKE '%Iron%Man%') AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND t.production_year > 1950 AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND k.id = mk.keyword_id)
