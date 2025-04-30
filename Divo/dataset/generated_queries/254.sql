--{"gen": "erase", "time": "/", "template": "generated-2f849eed-c412-4536-bc48-cc66151de751", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS voiced_char,
min(t.title) AS voiced_animation
FROM complete_cast AS cc,
comp_cast_type AS cct2,
char_name AS chn,
cast_info AS ci,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
person_info AS pi,
role_type AS rt,
title AS t
WHERE (cct2.kind = 'complete+verified' AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND it.info = 'height' AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND rt.role = 'actress' AND t.production_year BETWEEN 1980 AND 1995 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND chn.id = ci.person_role_id AND ci.person_id = pi.person_id AND cct2.id = cc.status_id)
