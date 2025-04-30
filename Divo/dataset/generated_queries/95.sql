--{"gen": "combine", "time": "/", "template": "8b", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS acress_pseudonym,
min(t.title) AS japanese_anime_movie
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n,
role_type AS rt,
title AS t,
keyword AS k,
movie_keyword AS mk,
char_name AS chn
WHERE (ci.note = '(voice: English version)' AND cn.country_code = '[jp]' AND mc.note LIKE '%(Japan)%' AND mc.note NOT LIKE '%(USA)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND n.name LIKE '%Yo%' AND n.name NOT LIKE '%Yu%' AND rt.role = 'actress' AND t.production_year BETWEEN 2006 AND 2007 AND (t.title LIKE 'One Piece%' OR t.title LIKE 'Dragon Ball Z%') AND k.keyword = 'character-name-in-title' AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND chn.id = ci.person_role_id AND ci.movie_id = mk.movie_id)
