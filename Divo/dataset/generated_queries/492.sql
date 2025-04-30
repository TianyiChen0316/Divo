--{"gen": "combine", "time": "/", "template": "generated-4a41215d-fcd8-4e47-8ad0-40ebe133ad0e", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name,
min(t.title) AS marvel_movie
FROM cast_info AS ci,
name AS n,
title AS t,
movie_companies AS mc,
role_type AS rt,
info_type AS it1,
movie_info AS mi,
person_info AS pi
WHERE (n.name LIKE '%Bert%' AND t.production_year > 2000 AND mc.note LIKE '%(200%)%' AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND rt.role = 'actor' AND lower(pi.info) LIKE '%india%' AND lower(it1.info) LIKE '%count%' AND lower(mi.info) LIKE '%usa%' AND t.id = ci.movie_id AND n.id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND n.id = pi.person_id AND mi.info_type_id = it1.id AND ci.movie_id = mi.movie_id AND mi.movie_id = mc.movie_id AND ci.person_id = pi.person_id AND t.id = mc.movie_id AND t.id = mi.movie_id)
