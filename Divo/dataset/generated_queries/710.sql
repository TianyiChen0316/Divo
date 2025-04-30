--{"gen": "erase", "time": "/", "template": "generated-58ffb058-827f-449e-bc50-132d177fca99", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS voicing_actress,
min(t.title) AS voiced_animation
FROM complete_cast AS cc,
cast_info AS ci,
info_type AS it,
info_type AS it3,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
name AS n,
person_info AS pi,
title AS t
WHERE (ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND it.info = 'rating' AND it3.info = 'height' AND mi.info ILIKE '%france%' AND n.gender = 'f' AND n.name LIKE '%An%' AND t.title = 'Shrek 2' AND t.production_year BETWEEN 2000 AND 2005 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND it3.id = pi.info_type_id)
