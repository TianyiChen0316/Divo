--{"gen": "erase", "time": "/", "template": "19d", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS jap_engl_voiced_movie
FROM char_name AS chn,
cast_info AS ci,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
role_type AS rt,
title AS t
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND it.info = 'release dates' AND rt.role = 'actress' AND t.production_year > 1950 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND it.id = mi.info_type_id AND rt.id = ci.role_id AND chn.id = ci.person_role_id)
