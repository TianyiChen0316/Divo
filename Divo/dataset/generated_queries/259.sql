--{"gen": "combine", "time": "/", "template": "generated-bb7e6c54-7cda-4103-a418-ae47b55316c7", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(chn.name) AS voiced_character,
min(n.name) AS voicing_actress,
min(t.title) AS american_movie
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n,
role_type AS rt,
title AS t,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
person_info AS pi,
keyword AS k,
movie_keyword AS mk
WHERE (ci.note = '(voice)' AND cn.country_code = '[us]' AND mc.note LIKE '%(200%)%' AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND n.gender = 'f' AND n.name LIKE '%Angel%' AND rt.role = 'actress' AND t.production_year BETWEEN 2007 AND 2010 AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%india%' AND lower(it1.info) LIKE '%count%' AND lower(mi.info) LIKE '%usa%' AND k.keyword = 'character-name-in-title' AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND n.id = ci.person_id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND mi.info_type_id = it1.id AND t.id = mi.movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = mc.movie_id AND ci.person_id = pi.person_id AND pi.person_id = an.person_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id)
