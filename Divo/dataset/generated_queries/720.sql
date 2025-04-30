--{"gen": "combine", "time": "/", "template": "5a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
title AS t,
movie_info_idx AS mi_idx
WHERE (ct.kind = 'production companies' AND mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mi_idx.movie_id = mi.movie_id AND mi.info_type_id = mi_idx.info_type_id)
