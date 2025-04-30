--{"gen": "erase", "time": "/", "template": "generated-3d44ed39-c01d-4d69-9f8a-624ce85e3791", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS voicing_actress,
min(t.title) AS voiced_animation
FROM aka_name AS an,
complete_cast AS cc,
cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
name AS n,
person_info AS pi,
title AS t
WHERE (ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND k.keyword = 'computer-animation' AND mi.info ILIKE '%france%' AND n.gender = 'm' AND n.name LIKE '%An%' AND t.title = 'Shrek 2' AND t.production_year BETWEEN 2000 AND 2005 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND n.id = ci.person_id AND n.id = an.person_id AND ci.person_id = an.person_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND k.id = mk.keyword_id AND pi.person_id = an.person_id)
