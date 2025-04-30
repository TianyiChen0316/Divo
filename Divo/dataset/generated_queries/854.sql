--{"gen": "erase", "time": "/", "template": "generated-bd038f6b-d958-4cdf-8ac4-4e002b4131a7", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(t.title) AS violent_liongate_movie
FROM cast_info AS ci,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
company_type AS ct
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND mc.note LIKE '%(Blu-ray)%' AND mi.info IN ('Horror', 'Thriller') AND t.production_year BETWEEN 2005 AND 2009 AND (t.title LIKE '%Freddy%' OR t.title LIKE '%Jason%' OR t.title LIKE 'Saw%') AND t.id = mi.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ct.id = mc.company_type_id)
