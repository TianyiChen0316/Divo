--{"gen": "erase", "time": "/", "template": "generated-a0ab70a1-874c-4665-9472-7d708ccaefd8", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(n.name) AS voicing_actress
FROM aka_name AS an,
cast_info AS ci,
movie_companies AS mc,
name AS n,
role_type AS rt,
person_info AS pi,
info_type AS it1,
movie_info AS mi
WHERE (ci.note = '(voice)' AND mc.note LIKE '%(200%)%' AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND n.gender = 'f' AND n.name LIKE '%Angel%' AND rt.role = 'writer' AND lower(mi.info) LIKE '%documentary%' AND lower(it1.info) LIKE 'birth date' AND (lower(pi.info) LIKE '%189%' OR lower(pi.info) LIKE '188%' OR lower(pi.info) LIKE '187%' OR lower(pi.info) LIKE '186%' OR lower(pi.info) LIKE '185%' OR lower(pi.info) LIKE '184%') AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id AND n.id = pi.person_id AND pi.info_type_id = it1.id AND ci.movie_id = mi.movie_id AND mi.movie_id = mc.movie_id AND ci.person_id = pi.person_id AND pi.person_id = an.person_id)
