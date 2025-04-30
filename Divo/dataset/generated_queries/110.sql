--{"gen": "erase", "time": "/", "template": "30c", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(n.name) AS writer,
min(t.title) AS complete_violent_movie
FROM cast_info AS ci,
info_type AS it1,
keyword AS k,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
title AS t
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'mini biography' AND k.keyword IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender = 'm' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND k.id = mk.keyword_id)
