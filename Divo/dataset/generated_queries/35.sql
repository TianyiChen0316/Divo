--{"gen": "combine", "time": "/", "template": "generated-ef097668-20c0-4b26-8d84-d83716b99cf0", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(t.title) AS internet_movie
FROM aka_title AS at,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
char_name AS chn,
cast_info AS ci,
role_type AS rt,
aka_name AS an,
name AS n
WHERE (cn.country_code = '[us]' AND mc.note LIKE '%(200%)%' AND mc.note LIKE '%(worldwide)%' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND t.production_year BETWEEN 2005 AND 2009 AND ci.note LIKE '%(producer)%' AND n.gender = 'f' AND n.name LIKE '%An%' AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND mi.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND n.id = an.person_id AND ci.person_id = an.person_id AND t.id = ci.movie_id AND at.movie_id = ci.movie_id)
