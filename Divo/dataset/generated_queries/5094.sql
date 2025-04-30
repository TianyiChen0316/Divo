--{"gen": "combine", "time": "/", "template": "generated-72f3f267-f8dc-490c-a9b4-f4a9e2a92063", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS of_person,
min(t.title) AS biography_movie
FROM aka_name AS an,
cast_info AS ci,
name AS n,
person_info AS pi,
title AS t,
info_type AS it,
link_type AS lt,
movie_link AS ml
WHERE (an.name LIKE '%a%' AND n.name_pcode_cf LIKE 'D%' AND n.gender = 'm' AND pi.note = 'Volker Boehm' AND t.production_year BETWEEN 1980 AND 1984 AND it.info = 'mini biography' AND lt.link IN ('references', 'referenced in', 'features', 'featured in') AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND t.id = ci.movie_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ml.linked_movie_id = t.id AND lt.id = ml.link_type_id AND it.id = pi.info_type_id AND ci.movie_id = ml.linked_movie_id)
