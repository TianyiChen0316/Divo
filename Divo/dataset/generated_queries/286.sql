--{"gen": "combine", "time": "/", "template": "16a", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym,
min(t.title) AS series_named_after_char
FROM aka_name AS an,
cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
info_type AS it1,
info_type AS it2,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (k.keyword = 'character-name-in-title' AND t.episode_nr >= 50 AND t.episode_nr < 100 AND it1.info = 'countries' AND it2.info = 'rating' AND kt.kind = 'movie' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info > '8.0' AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
