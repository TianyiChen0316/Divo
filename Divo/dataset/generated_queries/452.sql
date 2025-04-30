--{"gen": "erase", "time": "/", "template": "8a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS japanese_movie_dubbed
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n1,
role_type AS rt,
title AS t
WHERE (ci.note = '(voice: English version)' AND cn.country_code = '[jp]' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mc.note NOT LIKE '%(USA)%' AND n1.name LIKE '%Yo%' AND n1.name LIKE '%Yo%' AND rt.role = 'costume designer' AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id)
