--{"gen": "erase", "time": "/", "template": "7a", "dataset": "full_job", "rows": null}
SELECT *
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
link_type AS lt,
movie_link AS ml,
person_info AS pi
WHERE (an.name LIKE '%a%' AND it.info = 'mini biography' AND lt.link = 'features' AND pi.note = 'Volker Boehm' AND lt.id = ml.link_type_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id)
