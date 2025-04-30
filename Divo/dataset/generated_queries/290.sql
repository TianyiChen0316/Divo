--{"gen": "erase", "time": "/", "template": "25b", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(n.name) AS male_writer,
min(t.title) AS violent_movie_title
FROM cast_info AS ci,
info_type AS it1,
keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
name AS n,
title AS t
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND k.keyword IN ('murder', 'blood', 'gore', 'death', 'female-nudity') AND mi.info = 'Horror' AND n.gender = 'm' AND t.production_year > 2010 AND t.title LIKE 'Vampire%' AND t.id = mi.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND k.id = mk.keyword_id)
