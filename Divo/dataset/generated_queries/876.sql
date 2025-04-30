--{"gen": "erase", "time": "/", "template": "generated-73872d50-dda1-4b5b-9128-4f7b3aebde99", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS budget,
min(t.title) AS unsuccsessful_movie
FROM info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
movie_keyword AS mk,
cast_info AS ci,
keyword AS k,
link_type AS lt,
movie_link AS ml,
title AS t1
WHERE (it1.info = 'genres' AND t.production_year > 2000 AND (t.title LIKE 'Birdemic%' OR t.title LIKE '%Movie%') AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND k.keyword = 'character-name-in-title' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND t.id = ml.movie_id AND t.id = t1.id AND mc.movie_id = ml.movie_id AND mc.movie_id = t1.id AND ml.movie_id = ci.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id AND t1.id = ci.movie_id AND t1.id = mi.movie_id AND t1.id = mi_idx.movie_id)
