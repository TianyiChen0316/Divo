--{"gen": "combine", "time": "/", "template": "generated-e3f508f7-d2b3-42b2-bb18-d81923984a8d", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM movie_companies AS mc,
title AS t,
aka_title AS at,
movie_info AS mi,
movie_keyword AS mk,
aka_name AS a1,
cast_info AS ci,
company_name AS cn,
name AS n1,
role_type AS rt
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year BETWEEN 2005 AND 2010 AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND cn.country_code = '[us]' AND rt.role = 'writer' AND t.id = mc.movie_id AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND a1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND mc.company_id = cn.id AND ci.role_id = rt.id AND a1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id)
