--{"gen": "combine", "time": "/", "template": "e2b", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character,
min(t.title)
FROM char_name AS chn,
cast_info AS ci,
role_type AS rt,
movie_companies AS mc,
title AS t,
aka_name AS an,
company_name AS cn,
name AS n
WHERE (ci.note NOT LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND t.production_year > 2010 AND cn.country_code = '[us]' AND n.gender = 'f' AND n.name LIKE '%Ang%' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND mc.company_id = cn.id AND n.id = ci.person_id AND an.person_id = n.id AND an.person_id = ci.person_id)
