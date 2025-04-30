--{"gen": "erase", "time": "/", "template": "1b", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
movie_companies AS mc,
movie_info_idx AS mi_idx,
title AS t
WHERE (ct.kind = 'production companies' AND mc.note LIKE '%(Japan)%' AND t.production_year > 1990 AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id)
