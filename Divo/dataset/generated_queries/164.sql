--{"gen": "erase", "time": "/", "template": "generated-2a394b8e-cc60-4ad4-8124-97bec7d3d8df", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS movie_company,
min(t.title) AS drama_horror_movie
FROM company_name AS cn,
company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
title AS t,
cast_info AS ci,
name AS n1,
role_type AS rt,
movie_keyword AS mk
WHERE (cn.country_code = '[us]' AND ct.kind = 'production companies' AND mi.info IN ('Drama', 'Horror') AND t.production_year BETWEEN 2005 AND 2008 AND ci.note = '(voice: English version)' AND n1.name LIKE 'B%' AND n1.name NOT LIKE '%Yu%' AND rt.role = 'writer' AND t.id = mi.movie_id AND t.id = mc.movie_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND n1.id = ci.person_id AND ci.movie_id = t.id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND mk.movie_id = mc.movie_id)
