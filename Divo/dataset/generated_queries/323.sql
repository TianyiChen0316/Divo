--{"gen": "combine", "time": "/", "template": "generated-00034fc9-7533-41c7-859f-fc799781731d", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS acress_pseudonym,
min(t.title) AS japanese_anime_movie
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
title AS t,
role_type AS rt
WHERE (ci.note = '(voice: English version)' AND cn.country_code = '[jp]' AND mc.note LIKE '%(Japan)%' AND mc.note LIKE '%(co-production)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND t.production_year BETWEEN 2006 AND 2007 AND (t.title LIKE 'One Piece%' OR t.title LIKE 'Dragon Ball Z%') AND rt.role = 'writer' AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id)
