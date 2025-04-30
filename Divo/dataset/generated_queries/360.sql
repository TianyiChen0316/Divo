--{"gen": "combine", "time": "/", "template": "generated-00034fc9-7533-41c7-859f-fc799781731d", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS acress_pseudonym,
min(t.title) AS japanese_anime_movie
FROM aka_name AS an,
cast_info AS ci,
movie_companies AS mc,
title AS t,
person_info AS pi,
info_type AS it2,
name AS n,
movie_info AS mi,
aka_title AS at
WHERE (ci.note = '(voice: English version)' AND mc.note LIKE '%(Japan)%' AND mc.note LIKE '%(co-production)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND t.production_year BETWEEN 2006 AND 2007 AND (t.title LIKE 'One Piece%' OR t.title LIKE 'Dragon Ball Z%') AND it2.id = 3 AND mi.info ILIKE '%france%' AND pi.info ILIKE '%199%' AND ci.movie_id = t.id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND t.id = mi.movie_id AND mi.movie_id = ci.movie_id AND mi.info_type_id = it2.id AND ci.person_id = n.id AND n.id = pi.person_id AND t.id = at.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mi.movie_id AND ci.person_id = pi.person_id AND n.id = an.person_id AND pi.person_id = an.person_id)
