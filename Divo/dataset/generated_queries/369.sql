--{"gen": "erase", "time": "/", "template": "generated-7bd3072e-f448-4007-b90e-0ef5497ba1d4", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS voiced_char_name,
min(n.name) AS voicing_actress_name,
min(t.title) AS kung_fu_panda
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
name AS n,
role_type AS rt,
title AS t
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND it.info = 'release dates' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%201%' OR mi.info LIKE 'USA:%201%') AND n.gender = 'f' AND n.name LIKE '%Yo%' AND rt.role = 'actress' AND t.production_year > 2009 AND t.title LIKE '%Money%' AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id)
