--{"gen": "combine", "time": "/", "template": "generated-d4573e73-b2ad-4b06-9c39-72b406838b00", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(n.name) AS voicing_actress,
min(t.title) AS american_movie
FROM aka_name AS an,
cast_info AS ci,
movie_companies AS mc,
name AS n,
role_type AS rt,
title AS t,
char_name AS chn,
company_name AS cn,
info_type AS it,
movie_info AS mi
WHERE (ci.note = '(voice)' AND mc.note LIKE '%(200%)%' AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND n.gender = 'f' AND n.name LIKE '%Angel%' AND rt.role = 'writer' AND t.production_year BETWEEN 2007 AND 2010 AND cn.country_code = '[us]' AND it.info = 'release dates' AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id AND t.id = mi.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND chn.id = ci.person_role_id)
