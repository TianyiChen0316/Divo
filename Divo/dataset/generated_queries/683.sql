--{"gen": "combine", "time": "/", "template": "14c", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS north_european_dark_production
FROM info_type AS it1,
info_type AS it2,
keyword AS k,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
movie_companies AS mc,
cast_info AS ci,
name AS n
WHERE (it1.info = 'countries' AND it2.info = 'rating' AND k.keyword IS NOT NULL AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind IN ('movie', 'episode') AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND t.production_year > 2005 AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND n.name LIKE '%Bert%' AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND t.id = mc.movie_id AND mc.movie_id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND n.id = ci.person_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id)
