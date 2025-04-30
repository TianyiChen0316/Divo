--{"gen": "combine", "time": "/", "template": "e4b", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(t.title) AS modern_internet_movie
FROM aka_title AS at,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
company_type AS ct
WHERE (mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.production_year > 2000 AND ct.kind = 'production companies' AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ct.id = mc.company_type_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)
