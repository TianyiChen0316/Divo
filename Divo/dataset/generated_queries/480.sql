--{"gen": "erase", "time": "/", "template": "generated-f64a983b-df12-4926-bbd7-81fbd01f7dca", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_companies AS mc,
movie_keyword AS mk,
title AS t,
company_type AS ct,
info_type AS it,
movie_info AS mi
WHERE (ct.kind = 'production companies' AND mi.info IN ('USA', 'America') AND mc.movie_id = t.id AND t.id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id AND mk.movie_id = mi.movie_id)
