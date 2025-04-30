--{"gen": "combine", "time": "/", "template": "e1a", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year),
min(cn.name)
FROM cast_info AS ci,
title AS t,
char_name AS cn,
info_type AS it,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mi_idx.info > '2.0' AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND mi_idx.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id)
