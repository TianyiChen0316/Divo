--{"gen": "erase", "time": "/", "template": "9b", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(n.name) AS voicing_actress,
min(t.title) AS american_movie
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n,
role_type AS rt,
title AS t
WHERE (ci.note = '(voice)' AND cn.country_code = '[us]' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND n.gender = 'f' AND n.name LIKE 'Z%' AND rt.role = 'actress' AND t.production_year BETWEEN 2007 AND 2010 AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id)
