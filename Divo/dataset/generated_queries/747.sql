--{"gen": "combine", "time": "/", "template": "generated-8905cb25-e3b7-42c5-b90b-a13585ee0473", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year),
min(cn.name)
FROM cast_info AS ci,
title AS t,
char_name AS cn,
aka_name AS an,
movie_companies AS mc,
movie_keyword AS mk,
info_type AS it,
link_type AS lt,
movie_link AS ml,
person_info AS pi
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND it.info = 'top 250 rank' AND lt.link = 'features' AND pi.note = 'Volker Boehm' AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND mc.company_id = ci.person_role_id AND t.id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND ml.linked_movie_id = t.id AND lt.id = ml.link_type_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id)
