--{"gen": "erase", "time": "/", "template": "generated-6259d725-3ed7-4a7a-8e43-ae38ab7fc68e", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS of_person,
min(t.title) AS biography_movie
FROM aka_name AS an,
cast_info AS ci,
movie_link AS ml,
name AS n,
person_info AS pi,
title AS t,
char_name AS chn,
role_type AS rt,
movie_companies AS mc,
movie_keyword AS mk,
movie_info AS mi
WHERE (an.name LIKE '%a%' AND n.name_pcode_cf LIKE 'D%' AND n.gender = 'f' AND pi.note = 'Volker Boehm' AND t.production_year > 2010 AND mi.info ILIKE '%romance%' AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND t.id = ci.movie_id AND ml.linked_movie_id = t.id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND mi.movie_id = t.id AND mk.movie_id = t.id AND mi.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND mi.info_type_id = pi.info_type_id)
