--{"gen": "combine", "time": "/", "template": "generated-8f0f0cac-160f-4435-bfad-e0c5ad250486", "dataset": "full_job", "rows": null}
SELECT min(an1.name) AS costume_designer_pseudo,
min(t.title) AS movie_with_costumes
FROM aka_name AS an1,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n1,
role_type AS rt,
title AS t,
keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
name AS n,
info_type AS it1,
info_type AS it2,
person_info AS pi
WHERE (cn.country_code = '[us]' AND rt.role = 'costume designer' AND k.keyword LIKE '%sequel%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND it1.id = 3 AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%japan%' AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND n.id = ci.person_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND an1.person_id = n.id AND n.id = n1.id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND pi.info_type_id = it2.id AND an1.person_id = pi.person_id AND n1.id = pi.person_id AND ci.person_id = pi.person_id)
