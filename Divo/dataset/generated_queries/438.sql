--{"gen": "erase", "time": "/", "template": "generated-7c19ebb0-41e7-4922-93ea-ea357d638ad6", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(n.name) AS writer,
min(t.title) AS complete_gore_movie
FROM complete_cast AS cc,
cast_info AS ci,
movie_info AS mi,
movie_keyword AS mk,
name AS n,
title AS t
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND mi.info IN ('Horror', 'Thriller') AND n.gender = 'm' AND t.production_year > 2014 AND (t.title LIKE '%Freddy%' OR t.title LIKE '%Jason%' OR t.title LIKE 'Saw%') AND t.id = mi.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND n.id = ci.person_id)
