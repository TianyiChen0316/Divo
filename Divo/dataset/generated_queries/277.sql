--{"gen": "erase", "time": "/", "template": "generated-1e06cb14-b771-4afd-b7b0-5142a1886ec8", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS movie_company,
min(t.title) AS drama_horror_movie
FROM company_name AS cn,
info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
title AS t,
aka_name AS an1,
cast_info AS ci,
name AS n1,
movie_keyword AS mk
WHERE (cn.country_code = '[us]' AND it1.info = 'genres' AND mi.info IN ('Drama', 'Horror') AND t.production_year BETWEEN 2005 AND 2008 AND ci.note = '(voice: English version)' AND n1.name LIKE '%An%' AND n1.name NOT LIKE '%Yu%' AND t.id = mi.movie_id AND mi.info_type_id = it1.id AND t.id = mc.movie_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND mk.movie_id = mc.movie_id)
