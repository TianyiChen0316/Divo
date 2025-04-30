--{"gen": "combine", "time": "/", "template": "e1a", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year),
min(cn.name)
FROM cast_info AS ci,
title AS t,
char_name AS cn,
aka_name AS an,
info_type AS it,
person_info AS pi
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND an.name LIKE '%a%' AND it.info = 'mini biography' AND pi.note = 'Volker Boehm' AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id)
