--{"gen": "erase", "time": "/", "template": "generated-b16a70a1-c852-4c99-bb66-e6c64a89f3b9", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(n.name) AS voicing_actress,
min(t.title) AS american_movie
FROM aka_name AS an,
cast_info AS ci,
movie_companies AS mc,
name AS n,
role_type AS rt,
title AS t,
movie_keyword AS mk
WHERE (ci.note = '(voice)' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND n.gender = 'f' AND n.name LIKE '%Ang%' AND rt.role = 'writer' AND t.production_year BETWEEN 2007 AND 2010 AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id AND t.id = mk.movie_id AND ci.movie_id = mk.movie_id AND mk.movie_id = mc.movie_id)
