--{"gen": "combine", "time": "/", "template": "generated-a8aac6c8-497f-49d9-ba74-7a99f46d8ea6", "dataset": "full_job", "rows": null}
SELECT min(an1.name) AS actress_pseudonym,
min(t.title) AS japanese_movie_dubbed
FROM aka_name AS an1,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n1,
role_type AS rt,
title AS t,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
aka_name AS an,
movie_link AS ml,
person_info AS pi,
keyword AS k
WHERE (ci.note = '(voice: English version)' AND cn.country_code = '[jp]' AND mc.note LIKE '%(Japan)%' AND mc.note NOT LIKE '%(USA)%' AND n1.name LIKE '%Yo%' AND n1.name NOT LIKE '%Yu%' AND rt.role = 'actress' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND an.name LIKE '%a%' AND pi.note = 'Volker Boehm' AND k.keyword LIKE '%sequel%' AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND n.id = ci.person_id AND an1.person_id = n.id AND n.id = n1.id AND n.id = an.person_id AND n.id = pi.person_id AND ml.linked_movie_id = t.id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mk.keyword_id = k.id AND mc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND mi.info_type_id = pi.info_type_id AND ml.linked_movie_id = mi_idx.movie_id AND an1.person_id = an.person_id AND an1.person_id = pi.person_id AND n1.id = an.person_id AND n1.id = pi.person_id)
