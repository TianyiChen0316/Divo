--{"gen": "erase", "time": "/", "template": "generated-9f03dacd-4456-4708-b4ae-dd12f1f8a2c7", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym,
min(t.title) AS series_named_after_char
FROM aka_name AS an,
cast_info AS ci,
movie_companies AS mc,
name AS n,
title AS t,
movie_link AS ml,
person_info AS pi,
movie_info AS mi
WHERE (pi.note = 'Volker Boehm' AND mi.info ILIKE '%romance%' AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND n.id = pi.person_id AND ml.linked_movie_id = t.id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mi.movie_id = t.id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mc.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND mi.info_type_id = pi.info_type_id)
