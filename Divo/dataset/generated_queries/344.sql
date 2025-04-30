--{"gen": "erase", "time": "/", "template": "generated-45989eb0-30b7-4f8a-b8c8-18b823ae3fe3", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
movie_companies AS mc,
movie_info_idx AS mi_idx,
title AS t,
aka_title AS at,
movie_info AS mi,
movie_keyword AS mk
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year > 2003 AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
