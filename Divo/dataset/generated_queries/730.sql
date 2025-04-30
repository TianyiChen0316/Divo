--{"gen": "erase", "time": "/", "template": "9d", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(chn.name) AS voiced_char_name,
min(n.name) AS voicing_actress,
min(t.title) AS american_movie
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
name AS n,
title AS t
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND n.gender = 'f' AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND n.id = ci.person_id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id)
