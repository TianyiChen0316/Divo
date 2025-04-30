--{"gen": "combine", "time": "/", "template": "generated-d86d9b59-b092-4be9-ad5d-bcfa818a967a", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS cast_member_name,
min(pi.info) AS cast_member_info
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
link_type AS lt,
movie_link AS ml,
name AS n,
person_info AS pi,
title AS t,
keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
char_name AS chn,
role_type AS rt,
movie_companies AS mc
WHERE (an.name IS NOT NULL AND (an.name LIKE '%a%' OR an.name LIKE 'A%') AND it.info = 'mini biography' AND lt.link IN ('references', 'referenced in', 'features', 'featured in') AND n.name_pcode_cf BETWEEN 'A' AND 'F' AND pi.note IS NOT NULL AND t.production_year BETWEEN 1980 AND 2010 AND k.keyword LIKE '%sequel%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND t.id = ci.movie_id AND ml.linked_movie_id = t.id AND lt.id = ml.link_type_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = ml.linked_movie_id AND (n.gender = 'm' OR (n.gender = 'f' AND n.name LIKE 'A%')))
