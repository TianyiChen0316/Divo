--{"gen": "erase", "time": "/", "template": "generated-a22a3ff8-6acd-4673-bd11-d5915e8b643d", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS of_person,
min(t.title) AS biography_movie
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
name AS n,
person_info AS pi,
title AS t,
movie_companies AS mc,
movie_info_idx AS mi_idx
WHERE (an.name LIKE '%a%' AND it.info = 'mini biography' AND n.name_pcode_cf LIKE 'D%' AND n.gender = 'f' AND pi.note = 'Volker Boehm' AND t.production_year BETWEEN 1980 AND 1984 AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND t.id = ci.movie_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND mi_idx.movie_id = ci.movie_id AND ci.movie_id = mc.movie_id)
