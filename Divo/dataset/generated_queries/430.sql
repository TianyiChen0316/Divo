--{"gen": "erase", "time": "/", "template": "7a", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS of_person
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
link_type AS lt,
movie_link AS ml,
name AS n,
person_info AS pi
WHERE (an.name LIKE '%a%' AND it.info = 'mini biography' AND lt.link = 'features' AND n.name_pcode_cf BETWEEN 'A' AND 'F' AND pi.note = 'Volker Boehm' AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND lt.id = ml.link_type_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND (n.gender = 'm' OR (n.gender = 'f' AND n.name LIKE 'B%')))
