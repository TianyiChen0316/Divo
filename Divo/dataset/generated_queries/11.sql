--{"gen": "combine", "time": "/", "template": "e3a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS mainstream_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
cast_info AS ci,
info_type AS it1,
person_info AS pi,
complete_cast AS cc,
comp_cast_type AS cct2
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND t.production_year BETWEEN 2000 AND 2010 AND it1.id = 3 AND lower(pi.info) LIKE '%japan%' AND cct2.kind LIKE 'complete%' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mi.movie_id = mc.movie_id AND t.id = ci.movie_id AND it1.id = mi.info_type_id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct2.id = cc.status_id AND cc.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id)
