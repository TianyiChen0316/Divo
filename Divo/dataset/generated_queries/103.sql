--{"gen": "combine", "time": "/", "template": "generated-7c56e65e-b386-42ef-9df6-8a5ee4e973a5", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS biography_movie
FROM aka_name AS an,
cast_info AS ci,
info_type AS it,
person_info AS pi,
title AS t,
char_name AS chn,
role_type AS rt,
movie_companies AS mc
WHERE (an.name LIKE '%a%' AND it.info = 'mini biography' AND pi.note = 'Volker Boehm' AND t.production_year BETWEEN 1980 AND 1984 AND t.id = ci.movie_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id)
