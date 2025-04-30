--{"gen": "combine", "time": "/", "template": "generated-66f93844-200b-45ab-b55f-434f3329795e", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS biography_movie
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
person_info AS pi,
title AS t,
movie_link AS ml,
name AS n,
char_name AS chn,
role_type AS rt
WHERE (an.name LIKE '%a%' AND it.info = 'mini biography' AND pi.note = 'Volker Boehm' AND t.production_year BETWEEN 1980 AND 1984 AND rt.role = 'actress' AND t.id = ci.movie_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND an.person_id = n.id AND n.id = ci.person_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND ml.movie_id = ci.movie_id AND n.id = pi.person_id AND t.id = ml.movie_id)
