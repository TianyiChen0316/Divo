--{"gen": "erase", "time": "/", "template": "generated-735f3acb-fb13-458d-bc9a-3d7ac03df860", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM movie_companies AS mc,
movie_info_idx AS mi_idx,
title AS t,
aka_title AS at,
movie_info AS mi,
movie_keyword AS mk
WHERE (mc.note LIKE '%(200%)%' AND t.production_year > 2010 AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
