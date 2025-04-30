--{"gen": "erase", "time": "/", "template": "8a", "dataset": "full_job", "rows": null}
SELECT min(an1.name) AS actress_pseudonym
FROM aka_name AS an1,
cast_info AS ci,
movie_companies AS mc,
name AS n1,
role_type AS rt
WHERE (ci.note = '(voice: English version)' AND mc.note LIKE '%(Japan)%' AND mc.note NOT LIKE '%(USA)%' AND n1.name LIKE '%Downey%Robert%' AND n1.name NOT LIKE '%Yu%' AND rt.role = 'actor' AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id)
