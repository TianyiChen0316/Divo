--{"gen": "erase", "time": "/", "template": "generated-231b608e-8fd0-44b3-ba2e-7f29cfdc6816", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(t.title) AS complete_violent_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
cast_info AS ci,
movie_info AS mi,
movie_keyword AS mk,
title AS t
WHERE (cct1.kind IN ('cast', 'crew') AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND mi.info IN ('Horror', 'Thriller') AND t.production_year BETWEEN 2005 AND 2008 AND t.id = mi.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND cct1.id = cc.subject_id)
