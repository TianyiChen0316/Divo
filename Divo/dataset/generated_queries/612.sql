--{"gen": "erase", "time": "/", "template": "generated-bd23e8b3-9e7d-4fb6-8667-778f55653db4", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym,
min(t.title) AS series_named_after_char
FROM aka_name AS an,
cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
movie_info AS mi,
link_type AS lt,
movie_link AS ml,
person_info AS pi
WHERE (k.keyword = 'character-name-in-title' AND t.episode_nr < 100 AND lower(mi.info) LIKE '%action%' AND lt.link = 'features' AND pi.note = 'Volker Boehm' AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = t.id AND mk.movie_id = mi.movie_id AND ml.linked_movie_id = t.id AND lt.id = ml.link_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id AND mi.info_type_id = pi.info_type_id AND mc.movie_id = mi.movie_id AND mc.movie_id = ml.linked_movie_id)
