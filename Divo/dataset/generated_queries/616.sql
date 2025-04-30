--{"gen": "erase", "time": "/", "template": "generated-a8aac6c8-497f-49d9-ba74-7a99f46d8ea6", "dataset": "full_job", "rows": null}
SELECT min(an1.name) AS actress_pseudonym,
min(t.title) AS japanese_movie_dubbed
FROM aka_name AS an1,
cast_info AS ci,
movie_companies AS mc,
name AS n1,
title AS t,
movie_info AS mi,
movie_keyword AS mk,
name AS n
WHERE (ci.note = '(voice: English version)' AND mc.note LIKE '%(Japan)%' AND mc.note LIKE '%(Japan)%' AND n1.name LIKE '%Yo%' AND n1.name NOT LIKE '%Yu%' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND n.id = ci.person_id AND an1.person_id = n.id AND n.id = n1.id)
