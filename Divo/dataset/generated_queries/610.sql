--{"gen": "combine", "time": "/", "template": "generated-efa88513-c1b7-4601-9971-2366d9f12d41", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS cast_member_name,
min(pi.info) AS cast_member_info
FROM aka_name AS an,
cast_info AS ci,
name AS n,
person_info AS pi,
company_name AS cn,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t
WHERE (an.name IS NOT NULL AND (an.name LIKE '%a%' OR an.name LIKE 'A%') AND n.name_pcode_cf BETWEEN 'A' AND 'F' AND pi.note IS NOT NULL AND cn.name LIKE 'Lionsgate%' AND mc.note LIKE '%(Blu-ray)%' AND mi.info IN ('Horror', 'Thriller') AND t.production_year > 2008 AND (t.title LIKE '%Freddy%' OR t.title LIKE '%Jason%' OR t.title LIKE 'Saw%') AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND cn.id = mc.company_id AND mi_idx.info_type_id = pi.info_type_id AND (n.gender = 'm' OR (n.gender = 'f' AND n.name LIKE 'A%')))
