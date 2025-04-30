--{"gen": "erase", "time": "/", "template": "generated-6949a309-87dc-48ac-b0ef-85c43ba3e1e8", "dataset": "full_job", "rows": null}
SELECT *
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
movie_link AS ml,
person_info AS pi
WHERE (an.name LIKE '%a%' AND it.info = 'mini biography' AND pi.note = 'Volker Boehm' AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id)
