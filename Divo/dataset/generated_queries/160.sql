--{"gen": "erase", "time": "/", "template": "8b", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS acress_pseudonym,
min(t.title) AS japanese_anime_movie
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
title AS t
WHERE (ci.note = '(voice: English version)' AND cn.country_code = '[jp]' AND mc.note LIKE '%(worldwide)%' AND mc.note NOT LIKE '%(USA)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND t.production_year BETWEEN 1980 AND 1995 AND (t.title LIKE 'One Piece%' OR t.title LIKE 'Dragon Ball Z%') AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id)
