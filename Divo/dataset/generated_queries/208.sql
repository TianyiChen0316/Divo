--{"gen": "erase", "time": "/", "template": "generated-d5337949-0346-4ee2-9980-0dd36a8af438", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS cast_member_name,
min(pi.info) AS cast_member_info
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
movie_link AS ml,
name AS n,
person_info AS pi,
title AS t
WHERE (an.name IS NOT NULL AND (an.name LIKE '%a%' OR an.name LIKE 'A%') AND it.info = 'mini biography' AND n.name_pcode_cf BETWEEN 'A' AND 'F' AND pi.note IS NOT NULL AND t.kind_id = 3 AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND ci.movie_id = t.id AND t.id = ml.linked_movie_id AND (n.gender = 'm' OR (n.gender = 'f' AND n.name LIKE 'A%')))
