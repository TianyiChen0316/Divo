--{"gen": "combine", "time": "/", "template": "generated-ce38bb0f-5305-40a0-bb9e-bea4e49dd814", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name
FROM cast_info AS ci,
name AS n,
movie_companies AS mc,
movie_link AS ml,
title AS t,
movie_info AS mi,
person_info AS pi,
role_type AS rt
WHERE (n.name LIKE '%Downey%Robert%' AND mc.note IS NOT NULL AND t.production_year > 2014 AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND rt.role = 'costume designer' AND n.id = ci.person_id AND ml.movie_id = t.id AND t.id = mc.movie_id AND ml.movie_id = mc.movie_id AND ci.movie_id = t.id AND ci.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND t.id = mi.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND rt.id = ci.role_id AND ci.person_id = pi.person_id AND ml.movie_id = mi.movie_id AND n.id = pi.person_id)
