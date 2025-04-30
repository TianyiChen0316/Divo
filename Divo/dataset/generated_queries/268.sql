--{"gen": "combine", "time": "/", "template": "7a", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS of_person
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
movie_link AS ml,
name AS n,
person_info AS pi,
char_name AS chn,
movie_companies AS mc,
movie_info AS mi,
keyword AS k,
movie_keyword AS mk,
movie_info_idx AS mi_idx
WHERE (an.name LIKE '%a%' AND it.info = 'mini biography' AND n.name_pcode_cf BETWEEN 'A' AND 'F' AND pi.note = 'Volker Boehm' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND k.keyword = 'character-name-in-title' AND mi_idx.info > '8.0' AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND it.id = mi.info_type_id AND mk.keyword_id = k.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.info_type_id = pi.info_type_id AND mc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND ml.linked_movie_id = mi_idx.movie_id AND (n.gender = 'm' OR (n.gender = 'f' AND n.name LIKE 'B%')))
