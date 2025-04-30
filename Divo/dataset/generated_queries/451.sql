--{"gen": "combine", "time": "/", "template": "generated-4569c3f2-288d-4e02-9605-cebcff009352", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx,
aka_name AS an,
char_name AS chn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it2.info = 'rating' AND mi.info IN ('Horror', 'Thriller') AND mi.note IS NULL AND mi_idx.info > '6.0' AND k.keyword IN ('hero', 'martial-arts', 'hand-to-hand-combat', 'computer-animated-movie') AND t.production_year > 2010 AND t.title LIKE 'Kung Fu Panda%' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it2.id = mi_idx.info_type_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND k.id = mk.keyword_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id)
