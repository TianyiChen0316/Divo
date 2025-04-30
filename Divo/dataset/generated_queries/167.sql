--{"gen": "erase", "time": "/", "template": "generated-efa88513-c1b7-4601-9971-2366d9f12d41", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS cast_member_name,
min(pi.info) AS cast_member_info
FROM aka_name AS an,
cast_info AS ci,
movie_link AS ml,
name AS n,
person_info AS pi
WHERE (an.name IS NOT NULL AND (an.name LIKE '%a%' OR an.name LIKE 'A%') AND n.name_pcode_cf BETWEEN 'A' AND 'F' AND pi.note IS NOT NULL AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND (n.gender = 'm' OR (n.gender = 'f' AND n.name LIKE 'A%')))
