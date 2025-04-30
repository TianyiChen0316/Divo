--{"gen": "combine", "time": "/", "template": "4c", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM info_type AS it,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
complete_cast AS cc,
comp_cast_type AS cct2,
char_name AS chn,
cast_info AS ci
WHERE (it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mi_idx.info > '2.0' AND t.production_year > 1990 AND cct2.kind LIKE '%complete%' AND chn.name NOT LIKE '%Sherlock%' AND (chn.name LIKE '%Tony%Stark%' OR chn.name LIKE '%Iron%Man%') AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND cct2.id = cc.status_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mk.movie_id AND cc.movie_id = mi_idx.movie_id)
