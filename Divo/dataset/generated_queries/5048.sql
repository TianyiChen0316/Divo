--{"gen": "combine", "time": "/", "template": "4c", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM info_type AS it,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
complete_cast AS cc,
comp_cast_type AS cct1,
movie_companies AS mc,
movie_info AS mi
WHERE (it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mi_idx.info > '2.0' AND t.production_year > 1990 AND cct1.kind = 'complete+verified' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND cct1.id = cc.status_id AND mc.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
