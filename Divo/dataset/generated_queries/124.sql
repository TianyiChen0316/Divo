--{"gen": "erase", "time": "/", "template": "generated-116d2118-d2eb-496b-864b-761f8f840c7b", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(pi.info)
FROM person_info AS pi,
info_type AS it1,
info_type AS it2,
name AS n,
cast_info AS ci,
title AS t,
movie_info AS mi,
aka_title AS at,
movie_companies AS mc
WHERE (it2.id = 3 AND mi.info ILIKE '%sci%' AND it1.info ILIKE 'birth date' AND pi.info ILIKE '%199%' AND t.id = mi.movie_id AND t.id = ci.movie_id AND mi.movie_id = ci.movie_id AND mi.info_type_id = it2.id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it1.id AND t.id = at.movie_id AND t.id = mc.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mi.movie_id AND ci.person_id = pi.person_id)
