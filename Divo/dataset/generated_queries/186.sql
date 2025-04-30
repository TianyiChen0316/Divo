--{"gen": "combine", "time": "/", "template": "generated-d3e8b29f-8277-466b-9685-071fcad43e8f", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS budget,
min(t.title) AS unsuccsessful_movie
FROM company_name AS cn,
info_type AS it1,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
title AS t,
cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
link_type AS lt,
movie_link AS ml,
aka_name AS an1,
name AS n1
WHERE (cn.country_code = '[us]' AND it1.info = 'budget' AND it2.info = 'bottom 10 rank' AND t.production_year > 2000 AND (t.title LIKE 'Birdemic%' OR t.title LIKE '%Movie%') AND k.keyword = 'character-name-in-title' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id AND t.id = mc.movie_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mk.keyword_id = k.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND lt.id = ml.link_type_id AND mk.movie_id = ml.movie_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND an1.person_id = ci.person_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND t.id = ml.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id)
