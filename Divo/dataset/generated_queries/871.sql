--{"gen": "combine", "time": "/", "template": "e2b", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character,
min(t.title)
FROM char_name AS chn,
cast_info AS ci,
role_type AS rt,
title AS t,
info_type AS it,
movie_info AS mi,
aka_title AS at,
info_type AS it1,
complete_cast AS cc
WHERE (ci.note NOT LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND t.production_year > 2010 AND it.id = 3 AND mi.info ILIKE '%romance%' AND it1.info = 'release dates' AND t.id = ci.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND t.id = at.movie_id AND mi.movie_id = at.movie_id AND it1.id = mi.info_type_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND it1.id = it.id)
