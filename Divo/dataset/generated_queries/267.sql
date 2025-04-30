--{"gen": "combine", "time": "/", "template": "generated-ce38bb0f-5305-40a0-bb9e-bea4e49dd814", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name
FROM cast_info AS ci,
movie_keyword AS mk,
name AS n,
aka_name AS an1,
company_name AS cn,
movie_companies AS mc,
name AS n1,
movie_info AS mi
WHERE (n.name LIKE '%Downey%Robert%' AND cn.country_code = '[jp]' AND mc.note LIKE '%(worldwide)%' AND mc.note LIKE '%(worldwide)%' AND n1.name LIKE '%Yo%' AND n1.name NOT LIKE '%Yu%' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND mc.company_id = cn.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND an1.person_id = n.id AND n.id = n1.id)
