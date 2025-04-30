--{"gen": "combine", "time": "/", "template": "generated-6c569088-7f50-42dd-857c-511ec680aea2", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(t.title) AS movie
FROM aka_name AS an,
cast_info AS ci,
movie_companies AS mc,
name AS n,
role_type AS rt,
title AS t,
char_name AS chn,
movie_keyword AS mk,
info_type AS it,
movie_info AS mi
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND n.gender = 'f' AND n.name LIKE '%Ang%' AND rt.role = 'actress' AND t.production_year BETWEEN 2005 AND 2015 AND it.id = 3 AND mi.info ILIKE '%sci%' AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id AND chn.id = ci.person_role_id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id)
