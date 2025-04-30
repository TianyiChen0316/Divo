--{"gen": "erase", "time": "/", "template": "generated-0016fa97-b39a-4536-b64c-5ef7bcc832b7", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym,
min(t.title) AS series_named_after_char
FROM aka_name AS an,
cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
movie_info AS mi,
info_type AS it1,
person_info AS pi
WHERE (k.keyword = 'character-name-in-title' AND t.episode_nr >= 50 AND t.episode_nr < 100 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND lower(pi.info) LIKE '%india%' AND lower(it1.info) LIKE '%count%' AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mi.info_type_id = it1.id AND ci.person_id = pi.person_id AND pi.person_id = an.person_id)
