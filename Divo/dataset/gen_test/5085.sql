--{"gen": "erase", "time": "/", "template": "generated-1148b95e-0a12-4717-82fe-ac36d522b71d", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_keyword AS mk,
title AS t,
complete_cast AS cc,
cast_info AS ci,
movie_info AS mi,
name AS n
WHERE (t.production_year BETWEEN 2005 AND 2009 AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender = 'm' AND t.id = mk.movie_id AND t.id = mi.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND n.id = ci.person_id)
