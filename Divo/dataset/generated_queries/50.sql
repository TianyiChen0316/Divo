--{"gen": "combine", "time": "/", "template": "generated-3a1cc47d-1883-40b8-ab78-1670fde50132", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS mainstream_movie
FROM movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
keyword AS k,
movie_keyword AS mk,
company_type AS ct,
link_type AS lt,
movie_link AS ml
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '7.0' AND t.production_year BETWEEN 2000 AND 2010 AND k.keyword LIKE '%sequel%' AND ct.kind <> 'production companies' AND ct.kind IS NOT NULL AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id)
