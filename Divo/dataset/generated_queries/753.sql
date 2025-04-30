--{"gen": "combine", "time": "/", "template": "7a", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS of_person,
min(t.title) AS biography_movie
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
movie_link AS ml,
name AS n,
person_info AS pi,
title AS t,
role_type AS rt,
movie_companies AS mc,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi
WHERE (an.name LIKE '%a%' AND it.info = 'mini biography' AND n.name_pcode_cf BETWEEN 'A' AND 'F' AND pi.note = 'Volker Boehm' AND t.production_year BETWEEN 1980 AND 1995 AND k.keyword ILIKE '%love%' AND mi.info ILIKE '%romance%' AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND t.id = ci.movie_id AND ml.linked_movie_id = t.id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND mi.info_type_id = pi.info_type_id AND (n.gender = 'm' OR (n.gender = 'f' AND n.name LIKE 'B%')))
