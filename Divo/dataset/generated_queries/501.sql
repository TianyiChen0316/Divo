--{"gen": "combine", "time": "/", "template": "3b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
aka_title AS at,
movie_companies AS mc,
company_type AS ct
WHERE (k.keyword LIKE '%sequel%' AND mi.info IN ('Bulgaria') AND t.production_year > 2010 AND ct.kind = 'production companies' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND t.id = at.movie_id AND t.id = mc.movie_id AND ct.id = mc.company_type_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id)
